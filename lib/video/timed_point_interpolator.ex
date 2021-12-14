defmodule Video.TimedPointInterpolator do
  @tension 2.0 * 3.0
  # https://www.ibiblio.org/e-notes/Splines/Cardinal.htm
  # https://stackoverflow.com/questions/1257168/how-do-i-create-a-bezier-curve-to-represent-a-smoothed-polyline
  @spec segmentwise_bezier([Video.TimedPoint.t()], integer()) :: [Video.TimedPoint.t()]
  def segmentwise_bezier(polyline, interval) when is_integer(interval) do
    # duplicate the first and last coord so that we don't have to handle them
    # separately when calulating the derivative
    duped = [hd(polyline)] ++ polyline ++ [List.last(polyline)]

    interpolated =
      duped
      |> Enum.chunk_every(4, 1, :discard)
      |> Enum.flat_map(fn [p_im1, p_i, p_ip1, p_ip2] ->
        b_1 = %{
          lat: p_i.lat() + (p_ip1.lat() - p_im1.lat()) / @tension,
          lon: p_i.lon() + (p_ip1.lon() - p_im1.lon()) / @tension
        }

        b_2 = %{
          lat: p_ip1.lat() - (p_ip2.lat() - p_i.lat()) / @tension,
          lon: p_ip1.lon() - (p_ip2.lon() - p_i.lon()) / @tension
        }

        diff = p_ip1.time_offset_ms() - p_i.time_offset_ms()
        step = ceil(diff / interval)
        # modify interval to ensure we insert the points equidistant
        interval = diff / step

        # p_i] has been added in the previous step. The range can be empty
        # if the diff is smaller than the interval.
        Range.new(1, step, 1)
        |> Enum.map(&bezier(p_i, b_1, b_2, p_ip1, &1 * interval / diff))
      end)

    [hd(polyline) | interpolated]
  end

  defp bezier(b0, b1, b2, b3, t) when t > 0 and t < 1 do
    lat0 = b0.lat + t * (b1.lat - b0.lat)
    lon0 = b0.lon + t * (b1.lon - b0.lon)

    lat1 = b2.lat + t * (b3.lat - b2.lat)
    lon1 = b2.lon + t * (b3.lon - b2.lon)

    lat2 = lat0 + t * (lat1 - lat0)
    lon2 = lon0 + t * (lon1 - lon0)
    t2 = b0.time_offset_ms + t * (b3.time_offset_ms - b0.time_offset_ms)

    %Video.TimedPoint{
      lat: lat2,
      lon: lon2,
      time_offset_ms: round(t2)
    }
  end

  defp bezier(b0, _b1, _b2, _b3, t) when t == 0, do: b0
  defp bezier(_b0, _b1, _b2, b3, t) when t >= 1, do: b3
end
