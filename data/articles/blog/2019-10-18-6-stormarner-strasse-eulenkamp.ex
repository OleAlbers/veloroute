defmodule Data.Article.Blog.StormarnerStrasseEulenkamp do
  use Article.Default

  def name(), do: "#{created_at()}-6-stormarner-strasse-eulenkamp"
  def created_at(), do: ~D[2019-10-18]
  def updated_at(), do: ~D[2019-12-08]
  def title(), do: "Stormarner Straße und Eulenkamp West (Veloroute 6)"

  def type(), do: :planned
  def construction_site_id_hh(), do: [15014]
  def tags(), do: ["6", "w13"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "detour",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Umleitung",
        videos: [
          {"2021-06-19-veloroute6/GX011852", :start, :end},
          {"2021-06-19-veloroute6/GX011853", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zum Umbau", "veraltet, Archiv",
       "https://web.archive.org/web/20210514020458/https://www.hamburg.de/wandsbek/strassenbaustellen/14941782/stormarner-strasse-eulenkamp/"},
      {"Erläuterungsbericht",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008509"},
      {"Lagepläne",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008955"},
      {"Vergabe des Umbaus",
       "https://suche.transparenz.hamburg.de/dataset/9e5fb528-3285-45e7-ba35-ba13aff4556f"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand April 2022</h4>
    <p>Der Umbau in der <.m bounds="10.059486,53.576206,10.065375,53.579106" lon="10.060013" lat="53.576597" dir="forward">Stormarner Straße</.m> und einem kleinen Abschnitt im Eulenkamp ist fertig. Der Umbau zwischen <.m bounds="10.063564,53.578503,10.066184,53.579998" lon="10.065177" lat="53.578975" dir="forward">Elsässer Straße</.m> und der <.m bounds="10.066013,53.578862,10.068019,53.581363" lon="10.066557" lat="53.580286" dir="forward">Lengerckestraße</.m> steht noch aus.</p>

    <h4>Stand Dezember 2019</h4>
    <p>Die Planung wurde zwar im September 2019 abgeschlossen, nach Kritik von ADFC und Seniorenbeirat jedoch nochmals überarbeitet. Das Meckern hat sich gelohnt, die neueste Planung ist für den Radverkehr erheblich sicherer als nach dem vorigen Stand. Der Artikel wurde an den aktuellen Plan angepasst.</p>

    <p>Die Fahrradroute in der <.m bounds="10.05852,53.575489,10.064509,53.578955">Stormarner Straße</.m> bzw. <.m bounds="10.064109,53.578588,10.109514,53.591743">Walddörferstraße</.m> krankt an den geringen Breiten der Radfahrstreifen, die nahe der Kreuzungen auch unvermittelt aufhören. In der <.m bounds="10.059697,53.578874,10.065269,53.585348">Elsässer Straße</.m> und dem <.m bounds="10.064856,53.579146,10.075162,53.589051">Eulenkamp</.m> kommt jeweils noch das unkomfortable Kopfsteinpflaster hinzu. Für Radfahrende, die von der  <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.579033, lon: 10.064739, zoom: 18}))}>Walddörferstraße</.m> links in die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.579033, lon: 10.064739, zoom: 18}))}>Elsässer Straße</.m> abbiegen möchten, gibt es bisher auch keine klare Führung.</p>

    <p>Mit dem Umbau wird die Situation deutlich besser. Für den Radverkehr gibt es überall Asphalt als Oberfläche. Meist werden Radfahrstreifen von Rund 1,60m Breite eingesetzt, was hauptsächlich dem Parkplatzerhalt geschuldet ist – die Sicherheitsabstände zu Türen und beim Ausparken reduzieren die verfügbare Breite merklich. Ausnahmen sind das <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.576888, lon: 10.060035, zoom: 18})} ref="6">Teilstück Stormarner Straße zwischen S-Bahnhof und Wandsbeker Königstraße</.m>, wo es 2m breite Radfahrstreifen gibt. Stadteinwärts sogar durch einen extra Randstein geschützt um illegales Überfahren bei KFZ-Rückstau zu verhindern. Dies war der eingangs erwähnte Streitpunkt. Zwei Meter Breite gibt's auch ab der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.580515, lon: 10.067433, zoom: 18})} ref="6">Hultschiner Straße</.m>. In der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.578937, lon: 10.06505, zoom: 18})} ref="6">Elsässer Straße</.m> gibt's dagegen nur 1,6m Breite Schutzstreifen. Zum Glück handelt es sich um ein sehr kurzes Stück.</p>

    <p>Bei den Kreuzungen gibt es auch Verbesserungen: Die völlig überdimensionierte Kreuzung <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.580513, lon: 10.066269, zoom: 18})} ref="6">Lengereckestraße/Hultschiner Straße</.m> wird deutlich enger gefasst um Tempo herauszunehmen. An der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.579033, lon: 10.064739, zoom: 18})} ref="6">Einmündung Elsässer Straße in die Walddörferstraße</.m> wird auf Anregung des ADFC eine kleine Verkehrsinsel eingerichtet, damit rechtsabbiegende KFZ Platz für den Radverkehr lassen. In der Gegenrichtung wird zusätzlich eine indirekte Linksabiegemöglichkeit über die Fußampel geschaffen. Diese rückt dazu näher an die Kreuzung und erkennt Radfahrende mittels Wärmebild, schaltet aber immer nur nach Anforderung bzw. Erkennung.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
