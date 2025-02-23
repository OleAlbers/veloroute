defmodule Data.AutoGenerated.Video.Rendered_9eddb3330edecbc8cf3537f516c60686 do
  @moduledoc "#{"2021-06-17-kreuzung-max-brauer-allee-holstenstrasse: Max-Brauer-Allee, Sternschanze → Altona"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "2021-06-17-kreuzung-max-brauer-allee-holstenstrasse: Max-Brauer-Allee, Sternschanze → Altona"
  end

  @impl Video.Rendered
  def hash() do
    "9eddb3330edecbc8cf3537f516c60686"
  end

  @impl Video.Rendered
  def length_ms() do
    9000
  end

  @impl Video.Rendered
  def sources() do
    [{"2021-04-04-freizeitroute-12-speedup-5x/GX011181", "00:00:16.000", "00:00:25.000"}]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.55933325149701,
      maxLon: 9.951037077844312,
      minLat: 53.55822589221557,
      minLon: 9.947915886227545
    }
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "April 2021"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.55933325149701, lon: 9.951037077844312, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.559331, lon: 9.951032, time_offset_ms: 16},
      %Video.TimedPoint{lat: 53.559285, lon: 9.950923, time_offset_ms: 350},
      %Video.TimedPoint{lat: 53.559242, lon: 9.95081, time_offset_ms: 683},
      %Video.TimedPoint{lat: 53.559199, lon: 9.950699, time_offset_ms: 1017},
      %Video.TimedPoint{lat: 53.55916, lon: 9.95059, time_offset_ms: 1351},
      %Video.TimedPoint{lat: 53.559125, lon: 9.950482, time_offset_ms: 1684},
      %Video.TimedPoint{lat: 53.559092, lon: 9.950376, time_offset_ms: 2018},
      %Video.TimedPoint{lat: 53.559056, lon: 9.950265, time_offset_ms: 2352},
      %Video.TimedPoint{lat: 53.55902, lon: 9.950151, time_offset_ms: 2685},
      %Video.TimedPoint{lat: 53.558983, lon: 9.950035, time_offset_ms: 3019},
      %Video.TimedPoint{lat: 53.558942, lon: 9.949922, time_offset_ms: 3353},
      %Video.TimedPoint{lat: 53.5589, lon: 9.949799, time_offset_ms: 3686},
      %Video.TimedPoint{lat: 53.558855, lon: 9.949665, time_offset_ms: 4020},
      %Video.TimedPoint{lat: 53.558813, lon: 9.949536, time_offset_ms: 4354},
      %Video.TimedPoint{lat: 53.558772, lon: 9.949408, time_offset_ms: 4687},
      %Video.TimedPoint{lat: 53.558734, lon: 9.949286, time_offset_ms: 5021},
      %Video.TimedPoint{lat: 53.558694, lon: 9.949163, time_offset_ms: 5355},
      %Video.TimedPoint{lat: 53.558653, lon: 9.949038, time_offset_ms: 5688},
      %Video.TimedPoint{lat: 53.55861, lon: 9.948912, time_offset_ms: 6022},
      %Video.TimedPoint{lat: 53.558567, lon: 9.94879, time_offset_ms: 6356},
      %Video.TimedPoint{lat: 53.558525, lon: 9.948673, time_offset_ms: 6689},
      %Video.TimedPoint{lat: 53.558485, lon: 9.948554, time_offset_ms: 7023},
      %Video.TimedPoint{lat: 53.558447, lon: 9.948434, time_offset_ms: 7357},
      %Video.TimedPoint{lat: 53.558408, lon: 9.948317, time_offset_ms: 7690},
      %Video.TimedPoint{lat: 53.558368, lon: 9.948203, time_offset_ms: 8024},
      %Video.TimedPoint{lat: 53.558323, lon: 9.948095, time_offset_ms: 8358},
      %Video.TimedPoint{lat: 53.558274, lon: 9.948001, time_offset_ms: 8691},
      %Video.TimedPoint{lat: 53.55822589221557, lon: 9.947915886227545, time_offset_ms: 9000}
    ]
  end
end