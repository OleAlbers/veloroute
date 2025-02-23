defmodule Data.AutoGenerated.Video.Rendered_85e45f5b7958efca1803585db2256047 do
  @moduledoc "#{"alltagsroute-11: von der Veddel nach Eißendorf"}

# AUTOGENERATED. To update this file, run mix velo.videos.generate.
# See Video.Rendered for functionality.
"
  @behaviour Video.Rendered
  @impl Video.Rendered
  def name() do
    "alltagsroute-11: von der Veddel nach Eißendorf"
  end

  @impl Video.Rendered
  def hash() do
    "85e45f5b7958efca1803585db2256047"
  end

  @impl Video.Rendered
  def length_ms() do
    106_305
  end

  @impl Video.Rendered
  def sources() do
    [
      {"2021-07-18-whburg-and-on/GX012389", "00:00:42.242", :end},
      {"2021-07-18-whburg-and-on/GX012390", :start, :end},
      {"2021-07-18-whburg-and-on/GX012391", :start, :end},
      {"2021-07-18-whburg-and-on/GX012392", :start, "00:00:02.302"},
      {"2021-04-17-freizeitrouten-6und-7/GX011264", "00:00:02.169", "00:01:15.008"},
      {"2021-07-04-veloroute11/GX012118", "00:00:03.704", "00:00:13.747"},
      {"2021-07-17-gruenerring1-11whburg-haubach/GX012372", :start, "00:00:12.479"}
    ]
  end

  @impl Video.Rendered
  def rendered?() do
    true
  end

  @impl Video.Rendered
  def bbox() do
    %Geo.BoundingBox{
      maxLat: 53.52196843712575,
      maxLon: 10.015335,
      minLat: 53.500113041916165,
      minLon: 9.997629
    }
  end

  @impl Video.Rendered
  def renderer() do
    1
  end

  @impl Video.Rendered
  def metadata() do
    [{0, "Juli 2021"}, {10774, "April 2021"}, {83698, "Juli 2021"}]
  end

  @impl Video.Rendered
  def coords() do
    [
      %Video.TimedPoint{lat: 53.52196843712575, lon: 10.01507387724551, time_offset_ms: 0},
      %Video.TimedPoint{lat: 53.521937, lon: 10.015075, time_offset_ms: 125},
      %Video.TimedPoint{lat: 53.521854, lon: 10.015079, time_offset_ms: 459},
      %Video.TimedPoint{lat: 53.521768, lon: 10.015093, time_offset_ms: 792},
      %Video.TimedPoint{lat: 53.521682, lon: 10.015122, time_offset_ms: 1126},
      %Video.TimedPoint{lat: 53.521604, lon: 10.015166, time_offset_ms: 1459},
      %Video.TimedPoint{lat: 53.521542, lon: 10.015228, time_offset_ms: 1793},
      %Video.TimedPoint{lat: 53.521493, lon: 10.015288, time_offset_ms: 2127},
      %Video.TimedPoint{lat: 53.52146, lon: 10.015313, time_offset_ms: 2460},
      %Video.TimedPoint{lat: 53.521444, lon: 10.01531, time_offset_ms: 2794},
      %Video.TimedPoint{lat: 53.521465, lon: 10.015335, time_offset_ms: 2879},
      %Video.TimedPoint{lat: 53.521458, lon: 10.01533, time_offset_ms: 3213},
      %Video.TimedPoint{lat: 53.521431, lon: 10.015297, time_offset_ms: 3546},
      %Video.TimedPoint{lat: 53.5214, lon: 10.015243, time_offset_ms: 3880},
      %Video.TimedPoint{lat: 53.521382, lon: 10.015165, time_offset_ms: 4213},
      %Video.TimedPoint{lat: 53.521376, lon: 10.01508, time_offset_ms: 4547},
      %Video.TimedPoint{lat: 53.521368, lon: 10.014996, time_offset_ms: 4881},
      %Video.TimedPoint{lat: 53.52136, lon: 10.014921, time_offset_ms: 5214},
      %Video.TimedPoint{lat: 53.521343, lon: 10.014889, time_offset_ms: 5548},
      %Video.TimedPoint{lat: 53.521307, lon: 10.014884, time_offset_ms: 5633},
      %Video.TimedPoint{lat: 53.521298, lon: 10.014893, time_offset_ms: 5967},
      %Video.TimedPoint{lat: 53.521269, lon: 10.014923, time_offset_ms: 6300},
      %Video.TimedPoint{lat: 53.521236, lon: 10.014953, time_offset_ms: 6634},
      %Video.TimedPoint{lat: 53.521202, lon: 10.014983, time_offset_ms: 6967},
      %Video.TimedPoint{lat: 53.521169, lon: 10.015012, time_offset_ms: 7301},
      %Video.TimedPoint{lat: 53.521133, lon: 10.01503, time_offset_ms: 7634},
      %Video.TimedPoint{lat: 53.521101, lon: 10.01504, time_offset_ms: 7968},
      %Video.TimedPoint{lat: 53.521087, lon: 10.015043, time_offset_ms: 8302},
      %Video.TimedPoint{lat: 53.521085, lon: 10.015047, time_offset_ms: 8387},
      %Video.TimedPoint{lat: 53.521074, lon: 10.015052, time_offset_ms: 8721},
      %Video.TimedPoint{lat: 53.521035, lon: 10.015069, time_offset_ms: 9054},
      %Video.TimedPoint{lat: 53.520979, lon: 10.015093, time_offset_ms: 9388},
      %Video.TimedPoint{lat: 53.52091, lon: 10.015119, time_offset_ms: 9721},
      %Video.TimedPoint{lat: 53.520837, lon: 10.015139, time_offset_ms: 10055},
      %Video.TimedPoint{lat: 53.520762, lon: 10.015156, time_offset_ms: 10389},
      %Video.TimedPoint{lat: 53.52069263063063, lon: 10.015174018018019, time_offset_ms: 10689},
      %Video.TimedPoint{lat: 53.5206695, lon: 10.015193499999999, time_offset_ms: 10774},
      %Video.TimedPoint{lat: 53.520628, lon: 10.015206, time_offset_ms: 10941},
      %Video.TimedPoint{lat: 53.520537, lon: 10.015232, time_offset_ms: 11274},
      %Video.TimedPoint{lat: 53.520443, lon: 10.01526, time_offset_ms: 11608},
      %Video.TimedPoint{lat: 53.520344, lon: 10.015286, time_offset_ms: 11942},
      %Video.TimedPoint{lat: 53.52024, lon: 10.015299, time_offset_ms: 12275},
      %Video.TimedPoint{lat: 53.520137, lon: 10.015304, time_offset_ms: 12609},
      %Video.TimedPoint{lat: 53.520031, lon: 10.015312, time_offset_ms: 12943},
      %Video.TimedPoint{lat: 53.519927, lon: 10.015307, time_offset_ms: 13276},
      %Video.TimedPoint{lat: 53.519825, lon: 10.015283, time_offset_ms: 13610},
      %Video.TimedPoint{lat: 53.519725, lon: 10.015244, time_offset_ms: 13944},
      %Video.TimedPoint{lat: 53.519618, lon: 10.015214, time_offset_ms: 14277},
      %Video.TimedPoint{lat: 53.519512, lon: 10.015197, time_offset_ms: 14611},
      %Video.TimedPoint{lat: 53.519402, lon: 10.015154, time_offset_ms: 14945},
      %Video.TimedPoint{lat: 53.519298, lon: 10.015087, time_offset_ms: 15278},
      %Video.TimedPoint{lat: 53.5192, lon: 10.015005, time_offset_ms: 15612},
      %Video.TimedPoint{lat: 53.519109, lon: 10.01492, time_offset_ms: 15946},
      %Video.TimedPoint{lat: 53.519027, lon: 10.014834, time_offset_ms: 16279},
      %Video.TimedPoint{lat: 53.518937, lon: 10.014746, time_offset_ms: 16613},
      %Video.TimedPoint{lat: 53.518844, lon: 10.014661, time_offset_ms: 16947},
      %Video.TimedPoint{lat: 53.518752, lon: 10.014576, time_offset_ms: 17280},
      %Video.TimedPoint{lat: 53.518663, lon: 10.014483, time_offset_ms: 17614},
      %Video.TimedPoint{lat: 53.518579, lon: 10.014372, time_offset_ms: 17948},
      %Video.TimedPoint{lat: 53.518499, lon: 10.01426, time_offset_ms: 18281},
      %Video.TimedPoint{lat: 53.518419, lon: 10.014145, time_offset_ms: 18615},
      %Video.TimedPoint{lat: 53.518338, lon: 10.014038, time_offset_ms: 18949},
      %Video.TimedPoint{lat: 53.518258, lon: 10.013935, time_offset_ms: 19282},
      %Video.TimedPoint{lat: 53.51818, lon: 10.013825, time_offset_ms: 19616},
      %Video.TimedPoint{lat: 53.518107, lon: 10.013718, time_offset_ms: 19950},
      %Video.TimedPoint{lat: 53.518035, lon: 10.013611, time_offset_ms: 20283},
      %Video.TimedPoint{lat: 53.517961, lon: 10.013506, time_offset_ms: 20617},
      %Video.TimedPoint{lat: 53.517885, lon: 10.013399, time_offset_ms: 20951},
      %Video.TimedPoint{lat: 53.517818, lon: 10.01328, time_offset_ms: 21284},
      %Video.TimedPoint{lat: 53.517755, lon: 10.013148, time_offset_ms: 21618},
      %Video.TimedPoint{lat: 53.517698, lon: 10.013015, time_offset_ms: 21952},
      %Video.TimedPoint{lat: 53.517651, lon: 10.012888, time_offset_ms: 22285},
      %Video.TimedPoint{lat: 53.517597, lon: 10.012752, time_offset_ms: 22619},
      %Video.TimedPoint{lat: 53.517553, lon: 10.01261, time_offset_ms: 22953},
      %Video.TimedPoint{lat: 53.517508, lon: 10.012466, time_offset_ms: 23286},
      %Video.TimedPoint{lat: 53.517471, lon: 10.012324, time_offset_ms: 23620},
      %Video.TimedPoint{lat: 53.517434, lon: 10.012175, time_offset_ms: 23954},
      %Video.TimedPoint{lat: 53.517385, lon: 10.012043, time_offset_ms: 24287},
      %Video.TimedPoint{lat: 53.517322, lon: 10.011931, time_offset_ms: 24621},
      %Video.TimedPoint{lat: 53.51726, lon: 10.01182, time_offset_ms: 24955},
      %Video.TimedPoint{lat: 53.517214, lon: 10.011674, time_offset_ms: 25288},
      %Video.TimedPoint{lat: 53.517178, lon: 10.011516, time_offset_ms: 25622},
      %Video.TimedPoint{lat: 53.517149, lon: 10.011359, time_offset_ms: 25956},
      %Video.TimedPoint{lat: 53.517119, lon: 10.011198, time_offset_ms: 26289},
      %Video.TimedPoint{lat: 53.51709, lon: 10.011066, time_offset_ms: 26623},
      %Video.TimedPoint{lat: 53.517067, lon: 10.010961, time_offset_ms: 26957},
      %Video.TimedPoint{lat: 53.517061, lon: 10.010899, time_offset_ms: 27290},
      %Video.TimedPoint{lat: 53.517052, lon: 10.010884, time_offset_ms: 27624},
      %Video.TimedPoint{lat: 53.516997, lon: 10.010816, time_offset_ms: 27958},
      %Video.TimedPoint{lat: 53.516963, lon: 10.010706, time_offset_ms: 28291},
      %Video.TimedPoint{lat: 53.516915, lon: 10.010614, time_offset_ms: 28625},
      %Video.TimedPoint{lat: 53.516895, lon: 10.010391, time_offset_ms: 28959},
      %Video.TimedPoint{lat: 53.516894, lon: 10.010211, time_offset_ms: 29292},
      %Video.TimedPoint{lat: 53.516916, lon: 10.010026, time_offset_ms: 29626},
      %Video.TimedPoint{lat: 53.516906, lon: 10.009844, time_offset_ms: 29960},
      %Video.TimedPoint{lat: 53.516867, lon: 10.009662, time_offset_ms: 30293},
      %Video.TimedPoint{lat: 53.516826, lon: 10.009468, time_offset_ms: 30627},
      %Video.TimedPoint{lat: 53.516791, lon: 10.009291, time_offset_ms: 30961},
      %Video.TimedPoint{lat: 53.516759, lon: 10.00912, time_offset_ms: 31294},
      %Video.TimedPoint{lat: 53.516726, lon: 10.008944, time_offset_ms: 31628},
      %Video.TimedPoint{lat: 53.516694, lon: 10.008777, time_offset_ms: 31962},
      %Video.TimedPoint{lat: 53.516659, lon: 10.008621, time_offset_ms: 32295},
      %Video.TimedPoint{lat: 53.516629, lon: 10.008475, time_offset_ms: 32629},
      %Video.TimedPoint{lat: 53.5166, lon: 10.008327, time_offset_ms: 32963},
      %Video.TimedPoint{lat: 53.516578, lon: 10.008169, time_offset_ms: 33296},
      %Video.TimedPoint{lat: 53.516556, lon: 10.008004, time_offset_ms: 33630},
      %Video.TimedPoint{lat: 53.516543, lon: 10.00784, time_offset_ms: 33964},
      %Video.TimedPoint{lat: 53.516523, lon: 10.007682, time_offset_ms: 34297},
      %Video.TimedPoint{lat: 53.516496, lon: 10.007531, time_offset_ms: 34631},
      %Video.TimedPoint{lat: 53.516465, lon: 10.007382, time_offset_ms: 34965},
      %Video.TimedPoint{lat: 53.516432, lon: 10.007236, time_offset_ms: 35298},
      %Video.TimedPoint{lat: 53.516408, lon: 10.007083, time_offset_ms: 35632},
      %Video.TimedPoint{lat: 53.516387, lon: 10.00693, time_offset_ms: 35966},
      %Video.TimedPoint{lat: 53.516362, lon: 10.00678, time_offset_ms: 36299},
      %Video.TimedPoint{lat: 53.516338, lon: 10.006629, time_offset_ms: 36633},
      %Video.TimedPoint{lat: 53.516309, lon: 10.006473, time_offset_ms: 36967},
      %Video.TimedPoint{lat: 53.516279, lon: 10.006317, time_offset_ms: 37300},
      %Video.TimedPoint{lat: 53.51625, lon: 10.006161, time_offset_ms: 37634},
      %Video.TimedPoint{lat: 53.516223, lon: 10.005998, time_offset_ms: 37968},
      %Video.TimedPoint{lat: 53.516193, lon: 10.005834, time_offset_ms: 38301},
      %Video.TimedPoint{lat: 53.516162, lon: 10.005671, time_offset_ms: 38635},
      %Video.TimedPoint{lat: 53.516134, lon: 10.00551, time_offset_ms: 38969},
      %Video.TimedPoint{lat: 53.51611, lon: 10.005351, time_offset_ms: 39302},
      %Video.TimedPoint{lat: 53.516092, lon: 10.005196, time_offset_ms: 39636},
      %Video.TimedPoint{lat: 53.51607, lon: 10.005037, time_offset_ms: 39970},
      %Video.TimedPoint{lat: 53.516041, lon: 10.004877, time_offset_ms: 40303},
      %Video.TimedPoint{lat: 53.516009, lon: 10.004719, time_offset_ms: 40637},
      %Video.TimedPoint{lat: 53.515972, lon: 10.004569, time_offset_ms: 40971},
      %Video.TimedPoint{lat: 53.515933, lon: 10.004421, time_offset_ms: 41304},
      %Video.TimedPoint{lat: 53.515896, lon: 10.004281, time_offset_ms: 41638},
      %Video.TimedPoint{lat: 53.515848, lon: 10.004142, time_offset_ms: 41972},
      %Video.TimedPoint{lat: 53.515797, lon: 10.004012, time_offset_ms: 42305},
      %Video.TimedPoint{lat: 53.515743, lon: 10.003888, time_offset_ms: 42639},
      %Video.TimedPoint{lat: 53.51568, lon: 10.003764, time_offset_ms: 42973},
      %Video.TimedPoint{lat: 53.515619, lon: 10.003646, time_offset_ms: 43306},
      %Video.TimedPoint{lat: 53.515563, lon: 10.003517, time_offset_ms: 43640},
      %Video.TimedPoint{lat: 53.515524, lon: 10.003379, time_offset_ms: 43974},
      %Video.TimedPoint{lat: 53.515495, lon: 10.003232, time_offset_ms: 44307},
      %Video.TimedPoint{lat: 53.515467, lon: 10.00308, time_offset_ms: 44641},
      %Video.TimedPoint{lat: 53.515437, lon: 10.00293, time_offset_ms: 44975},
      %Video.TimedPoint{lat: 53.515409, lon: 10.002787, time_offset_ms: 45308},
      %Video.TimedPoint{lat: 53.515382, lon: 10.002649, time_offset_ms: 45642},
      %Video.TimedPoint{lat: 53.515358, lon: 10.002518, time_offset_ms: 45976},
      %Video.TimedPoint{lat: 53.515336, lon: 10.002395, time_offset_ms: 46309},
      %Video.TimedPoint{lat: 53.515317, lon: 10.002279, time_offset_ms: 46643},
      %Video.TimedPoint{lat: 53.515308, lon: 10.00217, time_offset_ms: 46977},
      %Video.TimedPoint{lat: 53.515312, lon: 10.002058, time_offset_ms: 47310},
      %Video.TimedPoint{lat: 53.51533, lon: 10.001965, time_offset_ms: 47644},
      %Video.TimedPoint{lat: 53.515365, lon: 10.001885, time_offset_ms: 47978},
      %Video.TimedPoint{lat: 53.515402, lon: 10.001801, time_offset_ms: 48311},
      %Video.TimedPoint{lat: 53.515443, lon: 10.001724, time_offset_ms: 48645},
      %Video.TimedPoint{lat: 53.515484, lon: 10.001648, time_offset_ms: 48979},
      %Video.TimedPoint{lat: 53.515517, lon: 10.00156, time_offset_ms: 49312},
      %Video.TimedPoint{lat: 53.515544, lon: 10.00147, time_offset_ms: 49646},
      %Video.TimedPoint{lat: 53.515566, lon: 10.001358, time_offset_ms: 49980},
      %Video.TimedPoint{lat: 53.515585, lon: 10.001248, time_offset_ms: 50313},
      %Video.TimedPoint{lat: 53.515603, lon: 10.001162, time_offset_ms: 50647},
      %Video.TimedPoint{lat: 53.515594, lon: 10.001073, time_offset_ms: 50981},
      %Video.TimedPoint{lat: 53.515541, lon: 10.001, time_offset_ms: 51314},
      %Video.TimedPoint{lat: 53.515474, lon: 10.000945, time_offset_ms: 51648},
      %Video.TimedPoint{lat: 53.515407, lon: 10.00089, time_offset_ms: 51982},
      %Video.TimedPoint{lat: 53.515339, lon: 10.000834, time_offset_ms: 52315},
      %Video.TimedPoint{lat: 53.515266, lon: 10.000775, time_offset_ms: 52649},
      %Video.TimedPoint{lat: 53.515192, lon: 10.000722, time_offset_ms: 52983},
      %Video.TimedPoint{lat: 53.515115, lon: 10.000669, time_offset_ms: 53316},
      %Video.TimedPoint{lat: 53.515036, lon: 10.00062, time_offset_ms: 53650},
      %Video.TimedPoint{lat: 53.514952, lon: 10.000553, time_offset_ms: 53984},
      %Video.TimedPoint{lat: 53.514865, lon: 10.000486, time_offset_ms: 54317},
      %Video.TimedPoint{lat: 53.514767, lon: 10.000419, time_offset_ms: 54651},
      %Video.TimedPoint{lat: 53.514668, lon: 10.000345, time_offset_ms: 54985},
      %Video.TimedPoint{lat: 53.514568, lon: 10.000262, time_offset_ms: 55318},
      %Video.TimedPoint{lat: 53.514462, lon: 10.000188, time_offset_ms: 55652},
      %Video.TimedPoint{lat: 53.514347, lon: 10.000135, time_offset_ms: 55986},
      %Video.TimedPoint{lat: 53.514234, lon: 10.000097, time_offset_ms: 56319},
      %Video.TimedPoint{lat: 53.514128, lon: 10.000061, time_offset_ms: 56653},
      %Video.TimedPoint{lat: 53.51402, lon: 10.000026, time_offset_ms: 56987},
      %Video.TimedPoint{lat: 53.513917, lon: 9.999991, time_offset_ms: 57320},
      %Video.TimedPoint{lat: 53.513817, lon: 9.999957, time_offset_ms: 57654},
      %Video.TimedPoint{lat: 53.513713, lon: 9.999927, time_offset_ms: 57988},
      %Video.TimedPoint{lat: 53.513607, lon: 9.999895, time_offset_ms: 58321},
      %Video.TimedPoint{lat: 53.513508, lon: 9.999862, time_offset_ms: 58655},
      %Video.TimedPoint{lat: 53.513405, lon: 9.999829, time_offset_ms: 58989},
      %Video.TimedPoint{lat: 53.513301, lon: 9.999793, time_offset_ms: 59322},
      %Video.TimedPoint{lat: 53.513196, lon: 9.999765, time_offset_ms: 59656},
      %Video.TimedPoint{lat: 53.513089, lon: 9.999736, time_offset_ms: 59990},
      %Video.TimedPoint{lat: 53.512982, lon: 9.999704, time_offset_ms: 60323},
      %Video.TimedPoint{lat: 53.51288, lon: 9.999671, time_offset_ms: 60657},
      %Video.TimedPoint{lat: 53.512776, lon: 9.99964, time_offset_ms: 60991},
      %Video.TimedPoint{lat: 53.512672, lon: 9.999606, time_offset_ms: 61324},
      %Video.TimedPoint{lat: 53.512576, lon: 9.999578, time_offset_ms: 61658},
      %Video.TimedPoint{lat: 53.512477, lon: 9.999548, time_offset_ms: 61992},
      %Video.TimedPoint{lat: 53.512377, lon: 9.999512, time_offset_ms: 62325},
      %Video.TimedPoint{lat: 53.512285, lon: 9.999475, time_offset_ms: 62659},
      %Video.TimedPoint{lat: 53.512188, lon: 9.999443, time_offset_ms: 62993},
      %Video.TimedPoint{lat: 53.512084, lon: 9.999417, time_offset_ms: 63326},
      %Video.TimedPoint{lat: 53.511984, lon: 9.999387, time_offset_ms: 63660},
      %Video.TimedPoint{lat: 53.511884, lon: 9.999357, time_offset_ms: 63994},
      %Video.TimedPoint{lat: 53.511783, lon: 9.999324, time_offset_ms: 64327},
      %Video.TimedPoint{lat: 53.511682, lon: 9.999296, time_offset_ms: 64661},
      %Video.TimedPoint{lat: 53.511583, lon: 9.999274, time_offset_ms: 64995},
      %Video.TimedPoint{lat: 53.511484, lon: 9.999245, time_offset_ms: 65328},
      %Video.TimedPoint{lat: 53.511387, lon: 9.999223, time_offset_ms: 65662},
      %Video.TimedPoint{lat: 53.511286, lon: 9.999209, time_offset_ms: 65996},
      %Video.TimedPoint{lat: 53.511188, lon: 9.999191, time_offset_ms: 66329},
      %Video.TimedPoint{lat: 53.511088, lon: 9.99918, time_offset_ms: 66663},
      %Video.TimedPoint{lat: 53.51099, lon: 9.999172, time_offset_ms: 66997},
      %Video.TimedPoint{lat: 53.510897, lon: 9.999159, time_offset_ms: 67330},
      %Video.TimedPoint{lat: 53.510795, lon: 9.999147, time_offset_ms: 67664},
      %Video.TimedPoint{lat: 53.510695, lon: 9.999137, time_offset_ms: 67998},
      %Video.TimedPoint{lat: 53.510592, lon: 9.999121, time_offset_ms: 68331},
      %Video.TimedPoint{lat: 53.510495, lon: 9.999105, time_offset_ms: 68665},
      %Video.TimedPoint{lat: 53.510399, lon: 9.999095, time_offset_ms: 68999},
      %Video.TimedPoint{lat: 53.510298, lon: 9.999087, time_offset_ms: 69332},
      %Video.TimedPoint{lat: 53.510197, lon: 9.999075, time_offset_ms: 69666},
      %Video.TimedPoint{lat: 53.510097, lon: 9.99906, time_offset_ms: 70000},
      %Video.TimedPoint{lat: 53.509994, lon: 9.999049, time_offset_ms: 70333},
      %Video.TimedPoint{lat: 53.509899, lon: 9.999038, time_offset_ms: 70667},
      %Video.TimedPoint{lat: 53.5098, lon: 9.999031, time_offset_ms: 71001},
      %Video.TimedPoint{lat: 53.509699, lon: 9.999021, time_offset_ms: 71334},
      %Video.TimedPoint{lat: 53.5096, lon: 9.999008, time_offset_ms: 71668},
      %Video.TimedPoint{lat: 53.509507, lon: 9.998997, time_offset_ms: 72002},
      %Video.TimedPoint{lat: 53.509409, lon: 9.998982, time_offset_ms: 72335},
      %Video.TimedPoint{lat: 53.509311, lon: 9.99897, time_offset_ms: 72669},
      %Video.TimedPoint{lat: 53.509217, lon: 9.998958, time_offset_ms: 73003},
      %Video.TimedPoint{lat: 53.509119, lon: 9.998941, time_offset_ms: 73336},
      %Video.TimedPoint{lat: 53.509023, lon: 9.998925, time_offset_ms: 73670},
      %Video.TimedPoint{lat: 53.508933, lon: 9.998908, time_offset_ms: 74004},
      %Video.TimedPoint{lat: 53.508836, lon: 9.998889, time_offset_ms: 74337},
      %Video.TimedPoint{lat: 53.50874, lon: 9.998871, time_offset_ms: 74671},
      %Video.TimedPoint{lat: 53.508643, lon: 9.99885, time_offset_ms: 75005},
      %Video.TimedPoint{lat: 53.508546, lon: 9.998829, time_offset_ms: 75338},
      %Video.TimedPoint{lat: 53.508447, lon: 9.998809, time_offset_ms: 75672},
      %Video.TimedPoint{lat: 53.508353, lon: 9.998787, time_offset_ms: 76006},
      %Video.TimedPoint{lat: 53.508258, lon: 9.998765, time_offset_ms: 76339},
      %Video.TimedPoint{lat: 53.508159, lon: 9.998741, time_offset_ms: 76673},
      %Video.TimedPoint{lat: 53.508057, lon: 9.998719, time_offset_ms: 77007},
      %Video.TimedPoint{lat: 53.507956, lon: 9.998698, time_offset_ms: 77340},
      %Video.TimedPoint{lat: 53.507852, lon: 9.998678, time_offset_ms: 77674},
      %Video.TimedPoint{lat: 53.507749, lon: 9.998659, time_offset_ms: 78008},
      %Video.TimedPoint{lat: 53.507645, lon: 9.998637, time_offset_ms: 78341},
      %Video.TimedPoint{lat: 53.507544, lon: 9.998612, time_offset_ms: 78675},
      %Video.TimedPoint{lat: 53.507447, lon: 9.998592, time_offset_ms: 79009},
      %Video.TimedPoint{lat: 53.507349, lon: 9.998571, time_offset_ms: 79342},
      %Video.TimedPoint{lat: 53.507249, lon: 9.99855, time_offset_ms: 79676},
      %Video.TimedPoint{lat: 53.507156, lon: 9.998531, time_offset_ms: 80010},
      %Video.TimedPoint{lat: 53.507073, lon: 9.998519, time_offset_ms: 80343},
      %Video.TimedPoint{lat: 53.50698, lon: 9.998499, time_offset_ms: 80677},
      %Video.TimedPoint{lat: 53.506881, lon: 9.998478, time_offset_ms: 81011},
      %Video.TimedPoint{lat: 53.506777, lon: 9.998455, time_offset_ms: 81344},
      %Video.TimedPoint{lat: 53.506671, lon: 9.998432, time_offset_ms: 81678},
      %Video.TimedPoint{lat: 53.506563, lon: 9.998422, time_offset_ms: 82012},
      %Video.TimedPoint{lat: 53.506454, lon: 9.998418, time_offset_ms: 82345},
      %Video.TimedPoint{lat: 53.50635, lon: 9.998395, time_offset_ms: 82679},
      %Video.TimedPoint{lat: 53.506257, lon: 9.998342, time_offset_ms: 83013},
      %Video.TimedPoint{lat: 53.506175, lon: 9.998271, time_offset_ms: 83346},
      %Video.TimedPoint{lat: 53.50611504491018, lon: 9.99821424251497, time_offset_ms: 83613},
      %Video.TimedPoint{lat: 53.50607034234235, lon: 9.998197057057057, time_offset_ms: 83698},
      %Video.TimedPoint{lat: 53.506003, lon: 9.998136, time_offset_ms: 83997},
      %Video.TimedPoint{lat: 53.505925, lon: 9.99809, time_offset_ms: 84331},
      %Video.TimedPoint{lat: 53.505845, lon: 9.998073, time_offset_ms: 84664},
      %Video.TimedPoint{lat: 53.505764, lon: 9.99807, time_offset_ms: 84998},
      %Video.TimedPoint{lat: 53.505683, lon: 9.998079, time_offset_ms: 85332},
      %Video.TimedPoint{lat: 53.5056, lon: 9.998112, time_offset_ms: 85665},
      %Video.TimedPoint{lat: 53.505515, lon: 9.998148, time_offset_ms: 85999},
      %Video.TimedPoint{lat: 53.505424, lon: 9.998181, time_offset_ms: 86332},
      %Video.TimedPoint{lat: 53.505327, lon: 9.998202, time_offset_ms: 86666},
      %Video.TimedPoint{lat: 53.505229, lon: 9.998195, time_offset_ms: 87000},
      %Video.TimedPoint{lat: 53.505129, lon: 9.998179, time_offset_ms: 87333},
      %Video.TimedPoint{lat: 53.505029, lon: 9.998161, time_offset_ms: 87667},
      %Video.TimedPoint{lat: 53.504932, lon: 9.998146, time_offset_ms: 88000},
      %Video.TimedPoint{lat: 53.504834, lon: 9.998133, time_offset_ms: 88334},
      %Video.TimedPoint{lat: 53.504735, lon: 9.99812, time_offset_ms: 88668},
      %Video.TimedPoint{lat: 53.504641, lon: 9.998104, time_offset_ms: 89001},
      %Video.TimedPoint{lat: 53.504545, lon: 9.998091, time_offset_ms: 89335},
      %Video.TimedPoint{lat: 53.504446, lon: 9.998075, time_offset_ms: 89668},
      %Video.TimedPoint{lat: 53.504351, lon: 9.99806, time_offset_ms: 90002},
      %Video.TimedPoint{lat: 53.504256, lon: 9.998052, time_offset_ms: 90336},
      %Video.TimedPoint{lat: 53.504157, lon: 9.998051, time_offset_ms: 90669},
      %Video.TimedPoint{lat: 53.504059, lon: 9.998059, time_offset_ms: 91003},
      %Video.TimedPoint{lat: 53.503962, lon: 9.998068, time_offset_ms: 91336},
      %Video.TimedPoint{lat: 53.50386, lon: 9.99808, time_offset_ms: 91670},
      %Video.TimedPoint{lat: 53.503762, lon: 9.998094, time_offset_ms: 92004},
      %Video.TimedPoint{lat: 53.503666, lon: 9.998087, time_offset_ms: 92337},
      %Video.TimedPoint{lat: 53.503572, lon: 9.998057, time_offset_ms: 92671},
      %Video.TimedPoint{lat: 53.503481, lon: 9.998014, time_offset_ms: 93004},
      %Video.TimedPoint{lat: 53.503389, lon: 9.997987, time_offset_ms: 93338},
      %Video.TimedPoint{lat: 53.503294, lon: 9.997966, time_offset_ms: 93671},
      %Video.TimedPoint{lat: 53.5032742994012, lon: 9.997962646706586, time_offset_ms: 93741},
      %Video.TimedPoint{lat: 53.503249, lon: 9.997975, time_offset_ms: 93826},
      %Video.TimedPoint{lat: 53.503198, lon: 9.997966, time_offset_ms: 94160},
      %Video.TimedPoint{lat: 53.503111, lon: 9.997953, time_offset_ms: 94493},
      %Video.TimedPoint{lat: 53.503025, lon: 9.997939, time_offset_ms: 94827},
      %Video.TimedPoint{lat: 53.502943, lon: 9.997927, time_offset_ms: 95160},
      %Video.TimedPoint{lat: 53.502855, lon: 9.997919, time_offset_ms: 95494},
      %Video.TimedPoint{lat: 53.502761, lon: 9.997905, time_offset_ms: 95828},
      %Video.TimedPoint{lat: 53.502665, lon: 9.99789, time_offset_ms: 96161},
      %Video.TimedPoint{lat: 53.502573, lon: 9.997879, time_offset_ms: 96495},
      %Video.TimedPoint{lat: 53.502481, lon: 9.997868, time_offset_ms: 96828},
      %Video.TimedPoint{lat: 53.502388, lon: 9.997859, time_offset_ms: 97162},
      %Video.TimedPoint{lat: 53.502295, lon: 9.997851, time_offset_ms: 97496},
      %Video.TimedPoint{lat: 53.5022, lon: 9.997843, time_offset_ms: 97829},
      %Video.TimedPoint{lat: 53.502109, lon: 9.99783, time_offset_ms: 98163},
      %Video.TimedPoint{lat: 53.502021, lon: 9.997813, time_offset_ms: 98496},
      %Video.TimedPoint{lat: 53.501932, lon: 9.997797, time_offset_ms: 98830},
      %Video.TimedPoint{lat: 53.501844, lon: 9.997784, time_offset_ms: 99164},
      %Video.TimedPoint{lat: 53.501756, lon: 9.997772, time_offset_ms: 99497},
      %Video.TimedPoint{lat: 53.501673, lon: 9.997757, time_offset_ms: 99831},
      %Video.TimedPoint{lat: 53.50159, lon: 9.997751, time_offset_ms: 100_164},
      %Video.TimedPoint{lat: 53.501506, lon: 9.997742, time_offset_ms: 100_498},
      %Video.TimedPoint{lat: 53.50143, lon: 9.997726, time_offset_ms: 100_832},
      %Video.TimedPoint{lat: 53.501346, lon: 9.997716, time_offset_ms: 101_165},
      %Video.TimedPoint{lat: 53.501252, lon: 9.99771, time_offset_ms: 101_499},
      %Video.TimedPoint{lat: 53.501152, lon: 9.997706, time_offset_ms: 101_832},
      %Video.TimedPoint{lat: 53.501052, lon: 9.997697, time_offset_ms: 102_166},
      %Video.TimedPoint{lat: 53.500946, lon: 9.997686, time_offset_ms: 102_499},
      %Video.TimedPoint{lat: 53.500843, lon: 9.997676, time_offset_ms: 102_833},
      %Video.TimedPoint{lat: 53.500746, lon: 9.997663, time_offset_ms: 103_167},
      %Video.TimedPoint{lat: 53.500646, lon: 9.997658, time_offset_ms: 103_500},
      %Video.TimedPoint{lat: 53.500544, lon: 9.997648, time_offset_ms: 103_834},
      %Video.TimedPoint{lat: 53.500452, lon: 9.997635, time_offset_ms: 104_167},
      %Video.TimedPoint{lat: 53.500368, lon: 9.997629, time_offset_ms: 104_501},
      %Video.TimedPoint{lat: 53.500296, lon: 9.99769, time_offset_ms: 104_835},
      %Video.TimedPoint{lat: 53.500249, lon: 9.997794, time_offset_ms: 105_168},
      %Video.TimedPoint{lat: 53.500209, lon: 9.997892, time_offset_ms: 105_502},
      %Video.TimedPoint{lat: 53.500172, lon: 9.99797, time_offset_ms: 105_835},
      %Video.TimedPoint{lat: 53.500122, lon: 9.998056, time_offset_ms: 106_169},
      %Video.TimedPoint{lat: 53.500113041916165, lon: 9.998085724550899, time_offset_ms: 106_305}
    ]
  end
end