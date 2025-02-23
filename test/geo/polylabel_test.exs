defmodule Geo.PolylabelTest do
  use ExUnit.Case, async: true

  test "calculates label position decently" do
    assert %Geo.Point{lat: 53.55811179646648, lon: 9.990647505320764} ==
             [
               %{lat: 53.55992549164499, lon: 9.989910113223242},
               %{lat: 53.559199230957816, lon: 9.989411680023242},
               %{lat: 53.55842523116329, lon: 9.988874680023242},
               %{lat: 53.55836123118026, lon: 9.987624680023243},
               %{lat: 53.55803923126576, lon: 9.98768368002324},
               %{lat: 53.55808723125299, lon: 9.98854768002324},
               %{lat: 53.5575452313969, lon: 9.988418680023242},
               %{lat: 53.55750723140697, lon: 9.989008680023241},
               %{lat: 53.55797523128272, lon: 9.989196680023243},
               %{lat: 53.557530690160775, lon: 9.992431823543242},
               %{lat: 53.557957943637334, lon: 9.992751065273243},
               %{lat: 53.558093231251405, lon: 9.991690680023241},
               %{lat: 53.558412231166734, lon: 9.989523680023243},
               %{lat: 53.559804493647114, lon: 9.99034984206324},
               %{lat: 53.55992549164499, lon: 9.989910113223242}
             ]
             |> Geo.Polylabel.calculate()
  end
end
