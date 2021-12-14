defmodule Geo.Smoother do
  @typep coord_dist :: [Geo.Point.like()]

  @spec by_range([Geo.Point.like()], float) :: [Geo.Point.like()]
  @doc """
  Takes a polyline and cutoff range in meters within which it will consider
  coordinates for smoothing. Put differently, it will smooth a coordinate using
  the preceeding/following coordinates within `range_in_meters` until the cutoff
  is met. Larger values mean more smoothing, but less accuracy. The coordinates
  are weighted by their distance, i.e. close coordinates have more influence
  than the ones further away.
  """
  def by_range(coords, range_in_meters \\ 15.0) do
    Enum.map_reduce(coords, {[], coords}, fn
      coord, {prev, [coord | next]} ->
        # find neighbars in range and smooth over them
        prev_in_range = take_while_in_range(coord, prev, range_in_meters)
        next_in_range = take_while_in_range(coord, next, range_in_meters)
        smoothed = weighted_average(coord, prev_in_range ++ next_in_range, range_in_meters)
        # map the smoothed coordinate and move the original one from "next" to "prev"
        {smoothed, {[coord | prev], next}}
    end)
    |> elem(0)
  end

  @spec take_while_in_range(Geo.Point.like(), [Geo.Point.like()], float()) :: [coord_dist]
  defp take_while_in_range(from, coords, range_in_meters) do
    Enum.reduce_while(coords, [], fn coord, acc ->
      dist = Geo.CheapRuler.dist(coord, from)

      if dist > range_in_meters,
        do: {:halt, acc},
        else: {:cont, [{coord, dist} | acc]}
    end)
  end

  @spec weighted_average(Geo.Point.like(), [coord_dist], float) :: Geo.Point.like()
  defp weighted_average(coord, coord_dists, range_in_meters) do
    coord_dists = [{coord, 0}] ++ coord_dists

    {sum_lat, sum_lon, sum_weight} =
      Enum.reduce(coord_dists, {0, 0, 0}, fn {coord, dist}, {sum_lat, sum_lon, sum_weight} ->
        weight = range_in_meters - dist
        {sum_lat + coord.lat * weight, sum_lon + coord.lon * weight, sum_weight + weight}
      end)

    %{coord | lat: sum_lat / sum_weight, lon: sum_lon / sum_weight}
  end
end
