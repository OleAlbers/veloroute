defmodule Video.RendererTest do
  use ExUnit.Case, async: true

  test "produces correct video render commands" do
    # silence warning
    System.put_env("DISABLE_OPENCL", "1")

    cmd =
      Video.RendererTest.Example
      |> Video.Renderer.render_cmd("FAKE_TMP")

    assert [
             "nice",
             "-n19",
             "ionice",
             "-c",
             "3",
             "ffmpeg",
             "-hide_banner",
             "-hwaccel",
             "auto",
             "-re",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.456",
             "-i",
             "videos/source/1.mp4",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.333",
             "-i",
             "videos/source/2.mp4",
             "-filter_complex",
             "[0]frei0r=jsonblur:videos/source/1.mp4.json.gz|0,settb=AVTB[blur0];[1]frei0r=jsonblur:videos/source/2.mp4.json.gz|0,settb=AVTB[blur1];[blur0][blur1]xfade=transition=fade:duration=0.26693360026693363:offset=0.18906639973306638,split=7[out0][out1][out2][out3][out4][out5][out6]",
             "-an",
             "-f",
             "hls",
             "-hls_playlist_type",
             "vod",
             "-sc_threshold",
             "0",
             "-movflags",
             "+faststart",
             "-pix_fmt",
             "yuv420p",
             "-hls_segment_type",
             "fmp4",
             "-master_pl_name",
             "stream.m3u8",
             "-hls_flags",
             "single_file+independent_segments",
             "-hls_list_size",
             "0",
             "-keyint_min",
             60,
             "-g",
             60,
             "-hls_time",
             2,
             "-c:v:0",
             "librav1e",
             "-tiles:v:0",
             "4",
             "-speed:v:0",
             "6",
             "-flags",
             "+cgop",
             "-map",
             "[out0]",
             "-s:0",
             "1280x720",
             "-metadata:s:v:0",
             "title=\"720p\"",
             "-b:v:0",
             "4.5M",
             "-maxrate:0",
             "4.95M",
             "-bufsize:0",
             "9.0M",
             "-c:v:1",
             "librav1e",
             "-tiles:v:1",
             "4",
             "-speed:v:1",
             "6",
             "-flags",
             "+cgop",
             "-map",
             "[out1]",
             "-s:1",
             "426x240",
             "-metadata:s:v:1",
             "title=\"240p\"",
             "-b:v:1",
             "1.5M",
             "-maxrate:1",
             "1.6500000000000001M",
             "-bufsize:1",
             "3.0M",
             "-c:v:2",
             "librav1e",
             "-tiles:v:2",
             "4",
             "-speed:v:2",
             "6",
             "-flags",
             "+cgop",
             "-map",
             "[out2]",
             "-s:2",
             "640x360",
             "-metadata:s:v:2",
             "title=\"360p\"",
             "-b:v:2",
             "3M",
             "-maxrate:2",
             "3.3000000000000003M",
             "-bufsize:2",
             "6.0M",
             "-c:v:3",
             "librav1e",
             "-tiles:v:3",
             "4",
             "-speed:v:3",
             "6",
             "-flags",
             "+cgop",
             "-map",
             "[out3]",
             "-s:3",
             "1920x1080",
             "-metadata:s:v:3",
             "title=\"1080p\"",
             "-b:v:3",
             "9M",
             "-maxrate:3",
             "9.9M",
             "-bufsize:3",
             "18.0M",
             "-c:v:4",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:4",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out4]",
             "-s:4",
             "426x240",
             "-metadata:s:v:4",
             "title=\"240p\"",
             "-b:v:4",
             "2M",
             "-maxrate:4",
             "2.2M",
             "-bufsize:4",
             "4.0M",
             "-c:v:5",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:5",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out5]",
             "-s:5",
             "640x360",
             "-metadata:s:v:5",
             "title=\"360p\"",
             "-b:v:5",
             "4M",
             "-maxrate:5",
             "4.4M",
             "-bufsize:5",
             "8.0M",
             "-c:v:6",
             "libx264",
             "-preset",
             "veryslow",
             "-refs:v:6",
             "5",
             "-flags",
             "+cgop",
             "-map",
             "[out6]",
             "-s:6",
             "1280x720",
             "-metadata:s:v:6",
             "title=\"720p\"",
             "-b:v:6",
             "6M",
             "-maxrate:6",
             "6.6000000000000005M",
             "-bufsize:6",
             "12.0M",
             "-x264-params",
             "threads=4",
             "-var_stream_map",
             "v:0 v:1 v:2 v:3 v:4 v:5 v:6",
             "FAKE_TMP/stream_%v.m3u8"
           ] ==
             cmd
  end

  test "produces correct video preview commands" do
    cmd =
      Video.RendererTest.Example
      |> Video.Renderer.preview_cmd(true)

    assert [
             "nice",
             "-n15",
             "ffmpeg",
             "-hide_banner",
             "-loglevel",
             "fatal",
             "-hwaccel",
             "auto",
             "-re",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.456",
             "-i",
             "videos/source/1.mp4",
             "-ss",
             "00:00:00.000",
             "-to",
             "00:00:00.333",
             "-i",
             "videos/source/2.mp4",
             "-filter_complex",
             "[0]frei0r=jsonblur:videos/source/1.mp4.json.gz|0,settb=AVTB[blur0];[1]frei0r=jsonblur:videos/source/2.mp4.json.gz|0,settb=AVTB[blur1];[blur0][blur1]xfade=transition=fade:duration=0.26693360026693363:offset=0.18906639973306638",
             "-pix_fmt",
             "yuv420p",
             "-s",
             "640x480",
             "-c:v",
             "libx264",
             "-preset",
             "ultrafast",
             "-qp",
             "17",
             "-an",
             "-f",
             "matroska",
             "-"
           ] == cmd
  end

  defmodule Example do
    @behaviour Video.Rendered

    @impl Video.Rendered
    def name(), do: "example"
    @impl Video.Rendered
    def hash(), do: "badc0ffeebadc0ffeebadc0ffeebadc0"
    @impl Video.Rendered
    def length_ms(), do: 579
    @impl Video.Rendered
    def renderer(), do: 3
    @impl Video.Rendered
    def metadata(), do: [{0, "Januar 2022"}]

    @impl Video.Rendered
    def sources(),
      do: [
        {"1.mp4", "00:00:00.000", "00:00:00.456"},
        {"2.mp4", "00:00:00.000", "00:00:00.333"}
      ]

    @impl Video.Rendered
    def coords(),
      do: [
        %Video.TimedPoint{lat: 53.507, lon: 10.044, time_offset_ms: 0},
        %Video.TimedPoint{lat: 53.508, lon: 10.042, time_offset_ms: 100},
        %Video.TimedPoint{lat: 53.509, lon: 10.040, time_offset_ms: 200},
        %Video.TimedPoint{lat: 53.510, lon: 10.038, time_offset_ms: 300},
        %Video.TimedPoint{lat: 53.511, lon: 10.036, time_offset_ms: 400}
      ]

    @impl Video.Rendered
    def rendered?(), do: true

    @impl Video.Rendered
    def bbox(), do: Geo.CheapRuler.bbox(coords())
  end
end
