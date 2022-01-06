#!/usr/bin/env ruby

require 'tmpdir'
require 'open3'

VIDEO_OUT_DIR = ARGV[0]
VIDEO_CMD = ARGV[1..-1]
PARENT_DIR = File.dirname(VIDEO_OUT_DIR)
NAME = File.basename($0, ".*")

def die(msg)
  warn "#{NAME}: #{msg}"
  exit(1)
end

def can_use?(codec)
  `ffmpeg -hide_banner -loglevel fatal -f lavfi -i rgbtestsrc -pix_fmt yuv420p -t 0.016 -c:v #{codec} -f mp4 -y /dev/null`
  $?.exitstatus == 0
end

if VIDEO_OUT_DIR.nil? || VIDEO_OUT_DIR == "" || VIDEO_CMD.empty?
  die <<~MAN

    Usage:
      #{NAME} <output directory> <command writing video to stdout>
    Example:
      #{NAME} /tmp/myvideo/ cat video.mp4
      #{NAME} /tmp/myvideo/ ./tools/video_concat.rb input.MP4 00:00:00.000 00:00:01.337 1.337

  MAN
end

unless File.directory?(PARENT_DIR) && File.writable?(PARENT_DIR)
  die "No write access to #{PARENT_DIR}"
end

if File.exist?(VIDEO_OUT_DIR)
  die "#{VIDEO_OUT_DIR} already exists -- refusing to overwrite"
end

TMP_DIR = Dir.mktmpdir("video_convert_streamable__#{File.basename(VIDEO_OUT_DIR)}__")
at_exit { FileUtils.rmdir(TMP_DIR) if Dir.exist?(TMP_DIR) && Dir.empty?(TMP_DIR) }

# length of a single segment in seconds. Quality usually switches between
# segments. https://ffmpeg.org/ffmpeg-formats.html#Options-8
HLS_TIME="2"
# FPS of the source videos. We can't easily change this, since the GPX tracks
# match the FPS.
FPS = 29.97
# GOP=group of pictures, essentially when to insert a keyframe. The script sets
# the min/max for this to the same value, i.e. there will be a keyframe exactly
# every GOP_SIZE. Ideally HLS_TIME * FPS = GOP_SIZE.
# https://video.stackexchange.com/a/24684
GOP_SIZE=(HLS_TIME.to_i * FPS).round.to_s

# codec tag specification:
# https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter
# vp9 levels: https://www.webmproject.org/vp9/levels/
# hevc tag: ISO/IEC 14496-15 (€)
CODEC_AVC = {
  codec: %w[libx264 -preset veryslow -x264opts opencl],
}
CODEC_VP9 = {
  tag_as: "vp09.00.30.08",
  codec: %w[libvpx-vp9 -row-mt 1 -quality best -threads 8 -tile-columns 1 -auto-alt-ref 1 -lag-in-frames 25],
  passes: [%w[-speed 4], %w[-speed 1]]
}
CODEC_HEVC = {
  tag_as: "hvc1.1.4.L186.B01",
  codec: can_use?("hevc_nvenc") \
    ? %w[hevc_nvenc -preset slow -tier:v:__INDEX__ high -level:v:__INDEX__ 6.2 -tag:v:__INDEX__ hvc1 -refs:v:__INDEX__ 0] \
    : %w[libx265    -preset slow -x265-params log-level=error:pass=__PASS__    -tag:v:__INDEX__ hvc1],
}
VARIANTS = [
  {title: "360p",  width:  640, height:  360, bitrate:  4, **CODEC_VP9},
  # low quality for mp4 fallback, as it's probably some old PC
  {title: "360p",  width:  640, height:  360, bitrate:  4, **CODEC_AVC, fallback: :mp4},
  {title: "240p",  width:  426, height:  240, bitrate:  2, **CODEC_AVC},
  # good quality for webm fallback, as it's more likely codec rather than perf related
  {title: "720p",  width: 1280, height:  720, bitrate:  6, **CODEC_VP9, fallback: :webm},
  {title: "720p",  width: 1280, height:  720, bitrate:  6, **CODEC_AVC},
  {title: "1080p", width: 1920, height: 1080, bitrate: 10, **CODEC_VP9},
  {title: "1080p", width: 1920, height: 1080, bitrate: 10, **CODEC_HEVC},
]

# The average bitrate is given in the variants above. This defined
# how much the maximum bitrate may deviate from that (as a ratio)
MAX_BITRATE = 1.1
# The sliding window in which the codec can distribute its bits,
# as a ratio of the bitrate, see
# https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
BUF_SIZE = 2.0

def nice
  %w[nice -n18 ionice -c 3]
end

def ffmpeg
  cmd = nice()
  cmd << %w[ffmpeg]
  # cmd << %w[-hide_banner -loglevel fatal]
  cmd << %w[-hwaccel auto]
  cmd << %w[-re -f matroska -r] << FPS.to_s << %w[-i -] << "-r" << FPS.to_s
  cmd << %w[-keyint_min] << GOP_SIZE << "-g" << GOP_SIZE << %w[-sc_threshold 0]
  cmd << %w[-pix_fmt yuv420p -refs 6]
  cmd
end

def variant_flags(idx, pass)
  var = VARIANTS[idx]
  codec = var[:codec].flatten.dup
  codec += var[:passes][pass-1] if var[:passes]
  codec.map! { |x| x.gsub("__INDEX__", "#{idx}") }
  codec.map! { |x| x.gsub("__PASS__", "#{pass}") }

  cmd = []
  cmd << "-c:v:#{idx}" << codec << "-flags" << "+cgop"
  cmd << %w[-map v:0] << "-s:#{idx}" << "#{var[:width]}x#{var[:height]}"
  cmd << "-metadata:s:v:#{idx}" << %|title="#{var[:title]}"|
  rate = var[:bitrate]
  cmd << ["-b:v:#{idx}", "#{rate}M"]
  cmd << ["-maxrate:#{idx}", "#{rate*MAX_BITRATE}M"]
  cmd << ["-bufsize:#{idx}", "#{rate*BUF_SIZE}M"]
  cmd << ["-pass:#{idx}", "#{pass}"]
  cmd << ["-passlogfile:#{idx}", File.join(TMP_DIR, "ffmpeg2pass_for_#{idx}.log")]

  cmd
end

def hls()
  cmd = %w[-movflags +faststart]
  cmd << %w[-f hls -hls_time] << HLS_TIME << %w[-hls_playlist_type vod]
  cmd << %w[-hls_segment_type fmp4]
  cmd << %w[-master_pl_name] << "stream.m3u8"
  cmd << %w[-hls_flags single_file+independent_segments -hls_list_size 0]
  cmd << %w[-var_stream_map] << VARIANTS.map.with_index { |_, idx| "v:#{idx}"}.join(" ")
  cmd << "#{TMP_DIR}/stream_%v.m3u8"
  cmd
end

def fallback(type)
  idx = VARIANTS.index { |v| v[:fallback] == type }
  cmd = nice()
  cmd << %w[ffmpeg -hide_banner -loglevel fatal]
  cmd << ["-i", "#{TMP_DIR}/stream_#{idx}.m4s"]
  cmd << %w[-c:v copy -movflags +faststart]
  cmd << [File.join(TMP_DIR, "fallback.#{type}")]
  cmd.flatten
end


def cancel(message = "Aborting…")
  warn "\n#{NAME}: #{message}"
  # $stdin.close unless $stdin.closed?
  RUNNING_CHILDREN.each { |pid| Process.kill("KILL", pid) rescue nil }
  # $ios.each(&:close)
  exit(2)
end

def run_pipe(cmd)
  wait_threads = Open3.pipeline_start(VIDEO_CMD, cmd.flatten)

  wait_threads.each do |wt|
    RUNNING_CHILDREN << wt.pid
  end

  wait_threads.each do |wt|
    exit_status = wt.value
    RUNNING_CHILDREN.delete(wt.pid)
    next if exit_status == 0
    cancel(<<~ERROR)
      subprocess failed ↑
      VIDEO_CMD: #{VIDEO_CMD.join(" ")}
      CONVERT: #{cmd.flatten.join(" ")}
    ERROR
  end
end

RUNNING_CHILDREN = []

Signal.trap("TERM") { cancel() }
Signal.trap("INT") { cancel() }

puts "\n#{NAME}: pass 1"
run_pipe(ffmpeg() + VARIANTS.size.times.flat_map { |idx| variant_flags(idx, 1) } + %w[-f rawvideo -y /dev/null])

puts "\n#{NAME}: pass 2"
run_pipe(ffmpeg() + VARIANTS.size.times.flat_map { |idx| variant_flags(idx, 2) } + hls())

puts "\n#{NAME}: fallbacks…"
# system(*fallback(:mp4), exception: true)
# system(*fallback(:webm), exception: true)

# manually tag codecs if ffmpeg didn't set them
stream_path = File.join(TMP_DIR, "stream.m3u8")
manifest = File.read(stream_path)
manifest.gsub!(/^#EXT-X-STREAM-INF:.*$/).with_index do |line, idx|
  tag = VARIANTS[idx][:tag_as]
  next line if !tag || line.include?("CODEC")
  warn "stream_#{idx} #{VARIANTS[idx][:title]}: manually tagging as #{tag}"
  %|#{line},CODECS="#{tag}"|
end
File.write(stream_path, manifest)

print "\nUploading… "
FileUtils.rm Dir.glob(File.join(TMP_DIR, "ffmpeg2pass_for_*"))
tries = 0
begin
  FileUtils.move(TMP_DIR, VIDEO_OUT_DIR, verbose: true)
rescue => e
  tries += 1
  warn "video_convert_streamable: Failed moving (try #{tries}): #{e}"
  tries <= 3 ? retry : die("Failed moving the files from #{TMP_DIR} to #{VIDEO_OUT_DIR}: #{e}")
end

puts "Done!"
