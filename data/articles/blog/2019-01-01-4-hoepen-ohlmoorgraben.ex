defmodule Data.Article.Blog.HoepenOhlmoorgraben do
  use Article.Default

  def name(), do: "#{created_at()}-4-hoepen-ohlmoorgraben"
  def created_at(), do: ~D[2019-01-01]
  def updated_at(), do: ~D[2020-10-31]
  def title(), do: "Höpen und Am Ohlmoorgraben (Veloroute 4)"

  def type(), do: :construction

  def tags(), do: ["4"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Pläne des finalen Entwurfs",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1009931"}
    ]
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "detour",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Umleitung Baustelle Ohlmoorgraben",
        videos: [
          {"2022-03-26-veloroute-4/GX013360", "00:03:01.415", :end},
          {"2022-03-26-veloroute-4/GX013361", :start, "00:00:10.911"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "detour",
        direction: :backward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Umleitung Baustelle Ohlmoorgraben",
        videos: [
          {"2022-03-26-veloroute-4/GX013369", :start, :end},
          {"2022-03-26-veloroute-4/GX013370", :start, "00:00:10.544"}
        ]
      }
    ]

  def text(assigns) do
    ~H"""
    <h4>Änderungen</h4> <p>Im Vergleich zum zweiten Entwurf haben sich an der finalen Planung nur Details geändert. Die aktuelle Fassung des Artikels beschreibt den neuesten Stand.</p>
    <h4>Alter Zustand</h4> <p>Bisher ist die Führung in diesem Bereich Stückwerk. Beim <.m bounds="10.017761,53.645511,10.024584,53.647172">Höpen</.m> handelt es sich um eine für den Radverkehr in beide Richtungen freigegebene Einbahnstraße, wobei die Radfahrenden entlang der Veloroute jeweils Vorfahrt gewähren müssen. Der Fuß- und Radweg <.m bounds="10.017631,53.646327,10.017861,53.649265">Am Ohlmoorgraben</.m> ist zu schmal um bei Gegenverkehr aneinander vorbeizukommen ohne auf den Fußweg aufzuweichen, hat dafür aber eine ebene Oberfläche.</p>
    <h4>Planung</h4> <p>Die mittlerweile in der Schlussfassung vorliegende Planung räumt dem Radverkehr entlang der Veloroute Vorfahrt ein. Die Einbahnstraßenregelung im <.m bounds="10.017761,53.645511,10.024584,53.647172">Höpen</.m> bleibt erhalten, die Parkplätze auf der Nordseite eingefasst und auf der Südseite Falschparken durch Findlinge unterbunden. Der Belag wird erneuert und das Stück Kopfsteinpflaster entfernt. Mit rund 3,80m ist genug Platz, selbst bei KFZ-Gegenverkehr.</p> <p>Im weiteren Verlauf geht die Führung zu einem Hochbordradweg (rotes Pflaster) über, der anfänglich noch 3,50m misst, <.m bounds="10.017631,53.646327,10.017861,53.649265">am Ohlmoorgraben</.m> jedoch nur noch rund 3,0m breit ist. Gut: <.m bounds="10.016293,53.646358,10.019803,53.648113" lon="10.0178644" lat="53.6472497" dir="forward">in der Kurve</.m> fällt der Weg breiter aus um den Radverkehr nicht unnötig auszubremsen.</p> <p><.m bounds="10.016234,53.648467,10.019343,53.650022" lon="10.0179368" lat="53.6491684" dir="forward">Am Nordende</.m> führt der neue Radweg in die <.a href="/article/2018-08-29-4-14-u-langenhorn-markt">Planungen um den Langenhorner Markt</.a> über.</p> <p>Man geht aktuell von einer Umsetzung ab Sommer 2021 aus.</p>
    <h4>Meinung</h4> <p>Es ist schade, das hier keine Fahrradstraße umgesetzt werden konnte. Diese war anfangs angedacht, hätte aber durch die durchgehende Asphaltierung die Baumwurzeln zu stark beschädigt. Das tut der Planung wenig Abbruch: die jetzt geplante Variante gibt dem heute schon überwiegendem Rad- und Fußverkehr deutliche Verbesserungen.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
