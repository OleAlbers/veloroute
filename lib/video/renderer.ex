defmodule Video.Renderer do
  @min_renderer_version 3

  @doc """
  Returns the commands to preview the given video(s).
  """
  def preview_cmd(rendered, blur) do
    ensure_min_version(rendered)

    blurred = if blur, do: blurs(rendered), else: settb(rendered)
    filter = Enum.join(blurred ++ xfades(rendered), ";")

    ["nice", "-n15", "ffmpeg", "-hide_banner", "-loglevel", "fatal"] ++
      inputs(rendered) ++
      [
        "-filter_complex",
        filter,
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
      ]
  end

  @spec render(Video.Rendered.t()) :: :ok | {:error, binary} | Util.exec_result()
  def render(rendered) do
    ensure_min_version(rendered)

    target = Video.Path.target(rendered.hash())

    case File.ls(target) do
      {:ok, []} -> render_run(rendered, target)
      {:error, :enoent} -> render_run(rendered, target)
      _ -> {:error, "#{target} already exists, refusing to overwrite"}
    end
  end

  defp ensure_min_version(rendered) do
    if rendered.renderer() < @min_renderer_version,
      do:
        raise(
          "cannot render #{rendered.name()} (#{rendered.hash()}) since it specifies an old renderer version. Need at least version 3."
        )
  end

  @nice_render ["nice", "-n19", "ionice", "-c", "3"]

  defp render_run(rendered, target) do
    pbar = Video.Renderer.Progress.new(rendered)
    cache_dir = Path.join([File.cwd!(), "data", "cache"])
    Temp.track!()

    try do
      with {:ok, tmp_path} =
             Temp.mkdir(%{basedir: cache_dir, prefix: "render_#{rendered.hash()}"}),
           tmp_dir <- Path.basename(tmp_path),
           cmd <- render_cmd(rendered, tmp_dir),
           %{result: :ok} <-
             Docker.run("tools/ffmpeg/Dockerfile.ffmpeg", cmd,
               env: [],
               stderr: pbar,
               name: "ffmpeg render"
             ),
           :ok <- manually_tag_missing(tmp_path),
           :ok <- create_fallbacks(tmp_dir),
           :ok <- move(tmp_path, target) do
        :ok
      end
    after
      Temp.cleanup()
    end
  end

  def render_cmd(rendered, tmp_dir) do
    filter = Enum.join(blurs(rendered) ++ xfades(rendered), ";")

    outputs = Enum.map(variants(), fn %{index: idx} -> "[out#{idx}]" end)
    filter = filter <> ",split=#{Enum.count(outputs)}#{Enum.join(outputs)}"

    @nice_render ++
      ["ffmpeg", "-hide_banner"] ++
      inputs(rendered) ++ ["-filter_complex", filter] ++ encoder(tmp_dir)
  end

  defp manually_tag_missing(tmp_dir) do
    m3u8 = Path.join(tmp_dir, "stream.m3u8")

    contents =
      File.read!(m3u8)
      |> String.split("\n")
      |> Enum.reduce({[], variants()}, fn line, {mapped, variants} ->
        cond do
          !String.starts_with?(line, "#EXT-X-STREAM-INF:") ->
            {[line | mapped], variants}

          String.contains?(line, "CODECS=") ->
            {[line | mapped], tl(variants)}

          hd(variants)[:tag_as] ->
            {[line <> ",CODECS=\"#{hd(variants)[:tag_as]}\"" | mapped], tl(variants)}

          true ->
            {[line | mapped], tl(variants)}
        end
      end)
      |> elem(0)
      |> Enum.reverse()
      |> Enum.join("\n")

    File.write!(m3u8, contents)
  end

  defp move(tmp_dir, target) do
    with :ok <- File.mkdir_p(target),
         {:ok, files} <- File.ls(tmp_dir) do
      Enum.map(files, fn file ->
        source = Path.join(tmp_dir, file)
        target = Path.join(target, file)
        move_file(source, target)
      end)
    end
    |> collect_errors()
  end

  defp move_file(source, target) do
    case File.rename(source, target) do
      :ok ->
        :ok

      {:error, :exdev} ->
        with {:ok, _copied} <- File.copy(source, target) do
          File.rm(source)
        end

      {:error, err} ->
        {:error, err}
    end
  end

  defp create_fallbacks(tmp_dir) do
    variants()
    |> Enum.filter(&is_map_key(&1, :fallback))
    |> Enum.map(fn %{index: idx, fallback: fb} ->
      cmd =
        @nice_render ++
          [
            "ffmpeg",
            "-hide_banner",
            "-loglevel",
            "fatal",
            "-i",
            Path.join(tmp_dir, "stream_#{idx}.m4s"),
            "-c:v",
            "copy",
            "-movflags",
            "+faststart",
            Path.join(tmp_dir, "fallback.#{fb}")
          ]

      Docker.run("tools/ffmpeg/Dockerfile.ffmpeg", cmd,
        env: [],
        name: "ffmpeg fallback #{fb}"
      )
    end)
    |> collect_errors()
  end

  defp collect_errors(list) do
    errors =
      Enum.reduce(list, [], fn item, errors ->
        case item do
          :ok -> errors
          %{result: :ok} -> errors
          %{result: {:error, err}} -> ["#{err}" | errors]
          {:error, err} -> ["#{err}" | errors]
        end
      end)

    if errors == [] do
      :ok
    else
      {:error, Enum.join(errors, "\n\n")}
    end
  end

  defp inputs(rendered) do
    ["-hwaccel", "auto", "-re"] ++
      Enum.flat_map(rendered.sources(), fn {path, from, to} ->
        from = if from in [:start, :seamless], do: [], else: ["-ss", from]
        to = if to == :end, do: [], else: ["-to", to]

        from ++ to ++ ["-i", Video.Path.source_rel_to_cwd(path)]
      end)
  end

  # uses the jsonblur frei0r plugin for the input videos (e.g. [0]) and outputs
  # them as blrs (e.g. [blur0]). Additionally it sets the timebase, see settb
  # for details.
  defp blurs(rendered) do
    rendered.sources()
    |> Enum.with_index()
    |> Parallel.map(2, fn {{path, from, _to}, idx} ->
      detections = Video.Path.detections_rel_to_cwd(path)
      from = if from in [:start, :seamless], do: 0, else: Video.Timestamp.in_milliseconds(from)
      blur_frame_skip = if from == 0, do: 0, else: ceil(fps(path) * from / 1000.0)
      "[#{idx}]frei0r=jsonblur:#{detections}|#{blur_frame_skip},settb=AVTB[blur#{idx}]"
    end)
  end

  # sets the timebase for all input videos (e.g. [0]) and outputs them as blurs
  # (e.g. [blur0]). This is sometimes required or ffmpeg will fail with
  # "different timebase".
  defp settb(rendered) do
    rendered.sources()
    |> Enum.with_index()
    |> Parallel.map(2, fn {{_path, _from, _to}, idx} ->
      "[#{idx}]settb=AVTB[blur#{idx}]"
    end)
  end

  # xfades reads the blurred videos (e.g. [blur0]) and cross fades or contacts
  # ("seamless") them as needed. It outputs a single, unnamed video at the end
  # of the filter graph.
  defp xfades(rendered) do
    fade = Video.Track.fade(rendered.renderer())
    count = length(rendered.sources())

    if count == 1 do
      ["[blur0]copy"]
    else
      rendered.sources()
      |> Enum.with_index()
      |> Parallel.map(2, fn {{path, from, to}, idx} ->
        start_in_s = if from in [:start, :seamless], do: 0, else: Video.Timestamp.in_seconds(from)
        to_in_s = if to == :end, do: duration_in_s(path), else: Video.Timestamp.in_seconds(to)
        segment_fade = if from == :seamless, do: 0, else: fade
        segment_duration = Float.round(to_in_s - start_in_s, 3)

        if segment_fade >= segment_duration,
          do:
            raise(
              "hash=#{rendered.hash()} segment=#{idx} is #{segment_duration}s long, but segment fade is #{segment_fade}s. Reduce the fade duration or change the segment."
            )

        {segment_duration, idx, segment_fade}
      end)
      |> Enum.reduce({0, []}, fn
        {dur, idx, segment_fade}, {total, filter_graph} ->
          new_duration = total + dur - segment_fade

          prev = if idx == 1, do: "[blur0]", else: "[fade#{idx - 1}]"
          next = "[blur#{idx}]"

          xfade =
            cond do
              idx == 0 -> nil
              segment_fade == 0 -> "#{prev}#{next}concat=n=2:v=1:a=0"
              true -> "#{prev}#{next}xfade=transition=fade:duration=#{fade}:offset=#{total}"
            end

          xfade =
            cond do
              xfade == nil -> nil
              idx == count - 1 -> xfade
              true -> "#{xfade}[fade#{idx}]"
            end

          filter_graph = if xfade, do: [xfade | filter_graph], else: filter_graph
          {new_duration, filter_graph}
      end)
      |> elem(1)
      |> Enum.reverse()
    end
  end

  defp duration_in_s(path), do: (path |> Video.Path.source() |> Video.Metadata.for())[:duration]

  defp fps(path), do: (path |> Video.Path.source() |> Video.Metadata.for())[:fps]

  # length of a single segment in seconds. Quality usually switches between
  # segments. https://ffmpeg.org/ffmpeg-formats.html#Options-8
  defp hls_time, do: 2

  # GOP=group of pictures, essentially when to insert a keyframe. The script sets
  # the min/max for this to the same value, i.e. there will be a keyframe exactly
  # every GOP_SIZE. Ideally HLS_TIME * FPS = GOP_SIZE.
  # https://video.stackexchange.com/a/24684
  defp gop_size, do: round(hls_time() * Video.Source.fps())

  # The average bitrate is given in the variants above. This defined
  # how much the maximum bitrate may deviate from that (as a ratio)
  defp max_bitrate(input), do: 1.1 * input
  # The sliding window in which the codec can distribute its bits,
  # as a ratio of the bitrate, see
  # https://trac.ffmpeg.org/wiki/Limiting%20the%20output%20bitrate
  defp buf_size(input), do: 2.0 * input

  # codec tag specification:
  # https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter

  # vp9 levels: https://www.webmproject.org/vp9/levels/
  #
  # libvpx generates blurry videos, so can't easily use it for HQ. Additionally,
  # hls.js locks all browsers to the initially selected codec, because of some
  # bug in Safari.
  # defp codec_vp9,
  #   do: %{
  #     codec:
  #       ~w[libvpx-vp9 -row-mt:v:__INDEX__ 1 -tile-columns 4 -frame-parallel 1 -speed 1 -threads 2 -refs:v:__INDEX__ 5],
  #     tag_as: "vp09.00.30.08"
  #   }

  # codec tag specification:
  # https://developer.mozilla.org/en-US/docs/Web/Media/Formats/codecs_parameter#av1
  # find seq_tier and seq_level_idx through:
  # ffmpeg -i <file> -c:v copy -bsf:v trace_headers -f null /dev/null 2>&1 | grep seq_ | head -n5
  # The 31 chosen for LL here is "Maximum parameters", i.e. no restrictions.
  defp codec_av1,
    do: %{
      codec: ~w[librav1e -tiles:v:__INDEX__ 4 -speed:v:__INDEX__ 6],
      tag_as: "av01.0.31M.08"
    }

  # ffmpeg itself manages avc tags
  defp codec_avc, do: %{codec: ~w[libx264 -preset veryslow -refs:v:__INDEX__ 5]}

  # hevc tag: ISO/IEC 14496-15 (€). If ffmpeg is modern enough, it will create
  # the tag. The one given here is a fallback.
  #
  # For some reason ffmpeg creates files that are not actually playable on the
  # only devices which support hevc (iOS). This is true even for old encodes, so
  # potentially something in iOS itself changed. Ran out of the debugging
  # timebox for this one.
  # defp codec_hevc do
  #   specific =
  #     if Video.Metadata.can_use?("hevc_nvenc"),
  #       do:
  #         ~w[hevc_nvenc -preset slow -tier:v:__INDEX__ high -level:v:__INDEX__ 6.2 -nonref_p 1 -spatial_aq 1 hvc1 -refs:v:__INDEX__ 0],
  #       else: ~w[libx265 -x265-params log-level=error]

  #   %{codec: specific ++ ~w[-tag:v:__INDEX__ hvc1], tag_as: "hvc1.1.4.L186.B01"}
  # end

  defp variants do
    codec_avc = codec_avc()
    codec_av1 = codec_av1()
    # codec_vp9 = codec_vp9()
    # codec_hevc = codec_hevc()

    [
      # av1, with default quality as first entry
      Map.merge(%{width: 1280, height: 720, bitrate: 4.5, fallback: :webm}, codec_av1),
      Map.merge(%{width: 426, height: 240, bitrate: 1.5}, codec_av1),
      Map.merge(%{width: 640, height: 360, bitrate: 3}, codec_av1),
      Map.merge(%{width: 1920, height: 1080, bitrate: 9}, codec_av1),
      # legacy codec
      Map.merge(%{width: 426, height: 240, bitrate: 2}, codec_avc),
      Map.merge(%{width: 640, height: 360, bitrate: 4, fallback: :mp4}, codec_avc),
      Map.merge(%{width: 1280, height: 720, bitrate: 6}, codec_avc)
    ]
    |> Enum.with_index()
    |> Enum.map(fn {info, idx} ->
      info
      |> Map.put(:index, idx)
      |> Map.put(:codec, Enum.map(info[:codec], &String.replace(&1, "__INDEX__", "#{idx}")))
    end)
  end

  def variant_flags() do
    # OpenCL can run out of memory on the GPU for some averse inputs it seems.
    opencl =
      if System.get_env("DISABLE_OPENCL", "0") == "1" do
        ~w[-x264-params threads=4]
      else
        IO.puts(
          :stderr,
          "\nOpenCL is enabled. If you run out of GPU memory, set DISABLE_OPENCL=1"
        )

        ~w[-x264-params opencl=true]
      end

    Enum.flat_map(variants(), fn %{width: w, height: h, bitrate: rate, index: idx, codec: codec} ->
      ["-c:v:#{idx}"] ++
        codec ++
        [
          "-flags",
          "+cgop",
          "-map",
          "[out#{idx}]",
          "-s:#{idx}",
          "#{w}x#{h}",
          "-metadata:s:v:#{idx}",
          "title=\"#{h}p\"",
          "-b:v:#{idx}",
          "#{rate}M",
          "-maxrate:#{idx}",
          "#{max_bitrate(rate)}M",
          "-bufsize:#{idx}",
          "#{buf_size(rate)}M"
        ]
    end) ++ opencl
  end

  defp encoder(tmp_dir) when is_binary(tmp_dir) do
    stream_map = variants() |> Enum.map(&"v:#{&1[:index]}") |> Enum.join(" ")

    ~w[
      -an
      -f hls
      -hls_playlist_type vod
      -sc_threshold 0
      -movflags +faststart
      -pix_fmt yuv420p
      -hls_segment_type fmp4
      -master_pl_name stream.m3u8
      -hls_flags single_file+independent_segments
      -hls_list_size 0] ++
      ["-keyint_min", gop_size(), "-g", gop_size(), "-hls_time", hls_time()] ++
      variant_flags() ++ ["-var_stream_map", stream_map, "#{tmp_dir}/stream_%v.m3u8"]
  end
end
