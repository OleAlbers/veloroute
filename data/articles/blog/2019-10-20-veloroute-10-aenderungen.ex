defmodule Data.Article.Blog.Veloroute10Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-20]

  def title(), do: "Änderungen Veloroute 10 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a href="/10">Veloroute 10</.a> nicht sich nicht so viel getan. Klar, <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.533384, lon: 10.025915, zoom: 16})} ref="10">die Baustelle um die neuen Bahnhalte Elbbrücken</.m> hat sich etwas geändert, aber sie ist leider noch nicht so weit fortgeschritten, dass man mit dem Fahrrad schon die Früchte der Arbeit ernten könnte.</p>
    <p>Eine kleine Verbesserung gab es dennoch: Am <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.529767, lon: 10.022436, zoom: 18})} ref="10">Veddeler Marktplatz</.m> wurde die Ampel aufgerüstet, sodass jetzt automatisch Grün für den Radverkehr angefordert wird. Dazu sollte man der Radspur genau folgen und ggf. das Aufleuchten des Handtasters prüfen. Wenn die Anmeldung geklappt hat, kommt man aber gut in einem Schwung über beide Furten – eine deutliche Verbesserung zu früher.</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die meisten Bilder sind von Anfang August 2019.</p>
    """
  end
end
