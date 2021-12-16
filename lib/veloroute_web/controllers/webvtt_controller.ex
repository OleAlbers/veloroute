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
    # Benchmark.flamegraph("webvtt", fn ->
    coords =
      rendered.coords()
      |> Video.TimedPointInterpolator.segmentwise_bezier(10)
      |> Geo.Smoother.by_range(1.0)
      |> Enum.map(&format/1)

    coords_to_webvtt(coords)
    # end)
  end

  defp coords_to_webvtt(coords) when is_list(coords) do
    [hd | tl] = Enum.reverse(coords)

    # technically we drop the position for the last coordinate, but it shouldn't
    # matter much
    {_, cues} =
      Enum.reduce(tl, {hd, []}, fn pt, {next, iolist} ->
        bearing = Geo.CheapRuler.bearing(pt, next)

        {pt,
         [
           pt.ts,
           " --> ",
           next.ts,
           "\n",
           to_string(pt.lat),
           " ",
           to_string(pt.lon),
           " ",
           to_string(approx(37)),
           "\n\n" | iolist
         ]}
      end)

    ["WEBVTT\n\n", cues]
  end

  defp format(coord) do
    ts = Video.Timestamp.from_timed_point(coord)
    lat = approx(coord.lat)
    lon = approx(coord.lon)
    %{lat: lat, lon: lon, ts: ts}
  end

  defp approx(val) do
    Kernel.round(val * 10_000_000) / 10_000_000
  end
end
