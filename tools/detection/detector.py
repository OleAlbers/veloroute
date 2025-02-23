#!/usr/bin/env python

import gzip
import json
import math
import os
import queue
import signal
import sys
import threading
import time

# pip install imageio imageio-ffmpeg torch tqdm
from tqdm import tqdm
import imageio
import imageio.plugins.ffmpeg
import torch

# the image size the model was trained at (--img param in yolov5)
MODEL_TRAIN_SIZE = 1280

# min confidence for objects to be included in the JSON output. Should be low to
# only need to run interference once, the more accurate filtering can happen
# during blurring.
THRESHOLD = 0.1

# which files should be inferred on
VIDEO_EXTENSIONS = [".mkv", ".MP4"]

# how often to save when inferring
SAVE_INTERVAL_SECONDS = 60


def desc(path):
    path, file = os.path.split(path)
    _, dir = os.path.split(path)
    return os.path.join(dir, file)


def json_out_paths(path):
    out = path + '.json.gz'
    return (out, out + '_wip')


def format_box(detection, names):
    keys = ['x_min', 'y_min', 'x_max', 'y_max', 'score', 'kind']
    out = dict(zip(keys, detection.tolist()))
    out['kind'] = names[int(out['kind'])]
    return out


def load_json_gzip(name):
    if not os.path.exists(name):
        return dict()

    try:
        with gzip.open(name, 'rb') as f:
            return json.load(f)
    except Exception as e:
        print(f"failed to read existing WIP detections: {e}")
        return dict()


def save_json_gzip(obj, name):
    with gzip.open(name, 'wb') as f:
        f.write(str.encode(json.dumps(obj)))


def load_video(name):
    # avoid breaking ctrl+c handling
    os.environ["IMAGEIO_FFMPEG_NO_PREVENT_SIGINT"] = "1"

    # imageio.plugins.ffmpeg.FfmpegFormat.Reader
    reader = imageio.get_reader(name)

    meta = reader.get_meta_data()
    frame_count = round(meta['duration'] * meta['fps'])
    if frame_count == 0:
        frame_count = reader.count_frames()

    iter = enumerate(reader.iter_data())
    bar = tqdm(iter, total=frame_count, desc=desc(
        name), unit="frame", leave=False)

    return bar, frame_count


def process(item, model, outer_bar):
    (name, size) = item
    (final, wip) = json_out_paths(name)

    detections = dict()
    gzip_loader = threading.Thread(
        target=lambda: detections.update(load_json_gzip(wip)))
    gzip_loader.start()

    frames, frame_count = load_video(name)
    gzip_loader.join()

    bytes_per_frame = math.floor(size / float(frame_count))
    bytes_remain = size - frame_count*bytes_per_frame

    json_saver = None
    last_save = time.time()
    for index, frame in frames:
        outer_bar.update(bytes_per_frame)
        if str(index) in detections:
            continue

        results = model(frame, size=MODEL_TRAIN_SIZE)
        formatted = [format_box(det, results.names) for det in results.xyxy[0]]
        detections[str(index)] = formatted

        if(time.time() - last_save >= SAVE_INTERVAL_SECONDS):
            if json_saver:
                json_saver.join()
            json_saver = threading.Thread(
                target=lambda: save_json_gzip(detections, wip))
            last_save = time.time()
            json_saver.start()

        if abort:
            break

    def finalizer():
        if json_saver:
            json_saver.join()
        save_json_gzip(detections, wip)
        if not abort:
            os.rename(wip, final)
    threading.Thread(target=finalizer).start()
    outer_bar.update(bytes_remain)


def recurse(folder, queue, bar):
    for parent, subdirs, files in os.walk(folder):
        if abort:
            break

        # walk older folders first to hide slow remote file system enumeration
        # while already processing the first videos
        subdirs.sort(reverse=True)

        for name in files:
            (_, ext) = os.path.splitext(name)
            if not ext in VIDEO_EXTENSIONS:
                continue

            final, _wip = json_out_paths(name)
            if final in files:
                continue

            full = os.path.join(parent, name)
            size = os.path.getsize(full)
            queue.put_nowait((full, size))
            bar.total += size
            bar.refresh()

    queue.put_nowait(None)


def usage(extra=None):
    if extra:
        print(extra)
    print(
        f"Usage:\n{sys.argv[0]} <path/to/weights.pt> <path/to/videos/folder>")
    sys.exit(1)


def parse_args():
    if len(sys.argv) != 3:
        usage(f"expected exactly 2 arguments, but got {len(sys.argv)-1}")
    weights = os.path.expanduser(sys.argv[1])
    video_dir = os.path.expanduser(sys.argv[2])

    if not os.path.exists(weights):
        usage(f"{weights}: weights file doesn't exist")
    if not os.path.isfile(weights):
        usage(f"{weights}: weights path isn't a regular file")
    if not os.path.exists(video_dir):
        usage(f"{video_dir}: video folder doesn't exist")
    if not os.path.isdir(video_dir):
        usage(f"{video_dir}: video path is not a folder")

    return (weights, video_dir)


def handler(signum, _frame):
    print("\nokay, aborting…")
    global abort
    abort = True


# graceful shutdown
abort = False
signal.signal(signal.SIGINT, handler)
signal.signal(signal.SIGTERM, handler)
signal.signal(signal.SIGQUIT, handler)

# startup
os.nice(20)
(weights, video_dir) = parse_args()

# find videos in background
q = queue.Queue()
bar = tqdm(iter, total=0, desc="all videos", unit="B", unit_scale=True)
threading.Thread(target=lambda: recurse(
    video_dir, q, bar), daemon=True).start()

# load model
model = torch.hub.load(f'ultralytics/yolov5', 'custom',
                       path=weights, skip_validation=True)
model.conf = THRESHOLD
bar.refresh()

# process
while not abort:
    item = q.get()
    if not item:
        break

    process(item, model, bar)
    q.task_done()

bar.close()
