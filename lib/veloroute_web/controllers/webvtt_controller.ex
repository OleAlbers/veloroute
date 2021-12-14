defmodule VelorouteWeb.WebVTTController do
  use VelorouteWeb, :controller
  require Logger

  import Video.Track, only: [valid_hash: 1]

  def webvtt(conn, %{"hash" => hash}) when valid_hash(hash) do
    text =
      hash
      |> Video.Rendered.get()
      |> convert()

    conn
    |> put_resp_content_type("text/vtt")
    |> send_resp(200, text)
  end

  def webvtt(conn, _params), do: send_resp(conn, 404, "no positional info found for this hash")

  defp convert(nil), do: "WEBVTT\n\n"

  defp convert(rendered) do
    coords =
      rendered.coords()
      |> Video.TimedPointInterpolator.segmentwise_bezier(40)
      |> Geo.Smoother.by_range(1.0)

    cues =
      coords
      |> Enum.map(fn now ->
        "<trkpt lat='#{now.lat}' lon='#{now.lon}' time='#{now.time_offset_ms}'></trkpt>"
      end)
      |> Enum.join("\n")

    # cues = "#{Video.Timestamp.zero} --> "

    # # cues = Enum.reduce(rev, {pos, ""}, fn -> )

    # cues =
    #   rendered.coords()
    #   |> Enum.map(fn pt -> Map.put(pt, :ts, Video.Timestamp.from_timed_point(pt)) end)
    #   |> Enum.chunk_every(2, 1)
    #   |> Enum.map(fn
    #     [now, next] -> "#{now.ts} --> #{next.ts}\n#{now.lat} #{now.lon}"
    #     [now] -> "#{now.ts} --> #{now.ts}\n#{now.lat} #{now.lon}"
    #   end)
    #   |> Enum.join("\n\n")

    # "WEBVTT\n\n#{cues}"
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <gpx xmlns="http://www.topografix.com/GPX/1/1" version="1.1">
    <trk>
    <trkseg>
      #{cues}
    </trkseg>
    </trk>
    </gpx>

    """
  end

  # defp convert(rendered) do
  #   cues =
  #     rendered.coords()
  #     |> Enum.map(fn pt -> Map.put(pt, :ts, Video.Timestamp.from_timed_point(pt)) end)
  #     # |> Enum.chunk_every(2, 1)
  #     |> Enum.map(fn
  #       pt -> "<#{pt.ts}> #{pt.lat} #{pt.lon}"
  #     end)
  #     |> Enum.join("\n")

  #   total = Video.Timestamp.from_milliseconds(rendered.length_ms())
  #   "WEBVTT\n\n#{Video.Timestamp.zero()} --> #{total}\n#{cues}"
  # end
end
