defmodule Data.Article.Static.RSWLueneburg do
  use Article.Static

  def id(), do: "rsw-lueneburg"
  def route_group(), do: :rsw
  def title(), do: "Radschnellweg nach Lüneburg"

  def color(), do: "#000000"

  def summary(),
    do: "Beschreibung und Video zum Radschnellweg HH-Veddel ↔ Lüneburg (Vorzugsstrecke)"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Lüneburg",
        direction: :forward,
        from: "Hamburg Elbbrücken",
        to: "Lüneburg Zeltberg",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg nach Lüneburg",
        videos: [
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012366", "00:00:57.491", "00:01:13.040"},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011460.MP4_time_lapse.mkv",
           "00:01:21.748", :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX021460.MP4_time_lapse.mkv", :start,
           :end},
          {"2021-07-18-whburg-and-on/GX012391", :start, :end},
          {"2021-07-18-whburg-and-on/GX012392", :start, "00:00:02.302"},
          {"2021-04-17-freizeitrouten-6und-7/GX011264", "00:00:02.169", "00:01:15.008"},
          {"2021-07-04-veloroute11/GX012118", "00:00:03.704", "00:00:13.747"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012372", :start, "00:00:11.445"},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012373", "00:00:35.736", :end},
          {"2021-07-17-gruenerring1-11whburg-haubach/GX012374", :start, "00:01:02.162"},
          {"2021-08-15-rsw-lueneburg/GX012672", "00:01:15.475", :end},
          {"2021-08-15-rsw-lueneburg/GX012673", :start, :end},
          {"2021-08-15-rsw-lueneburg/GX012674", :start, :end},
          {"2021-08-15-rsw-lueneburg/GX012675", :start, "00:03:56.203"},
          {"2021-08-15-rsw-lueneburg/GX012676", :start, :end},
          {"2021-08-15-rsw-lueneburg/GX022676", :start, "00:00:13.013"},
          {"2021-08-15-rsw-lueneburg/GX012677", "00:00:22.923", "00:01:29.890"},
          {"2021-08-15-rsw-lueneburg/GX012678", "00:00:01.068", :end},
          {"2021-08-15-rsw-lueneburg/GX012679", :start, "00:01:59.186"},
          {"2021-08-15-rsw-lueneburg/GX012683", :start, :end},
          {"2021-08-15-rsw-lueneburg/GX012684", :start, "00:02:15.602"},
          {"2021-08-15-rsw-lueneburg/GX012686.MP4.time_lapse.mkv", "00:00:00.434", :end},
          {"2021-08-15-rsw-lueneburg/GX022686.MP4.time_lapse.mkv", :start, :end},
          {"2021-08-15-rsw-lueneburg/GX012687.MP4.time_lapse.mkv", :start, :end},
          {"2021-08-15-rsw-lueneburg/GX012688.MP4.time_lapse.mkv", :start, "00:01:22.950"},
          {"2021-08-15-rsw-lueneburg/GX012688.MP4.time_lapse.mkv", "00:01:28.388", "00:02:12.099"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Lüneburg",
       "https://metropolregion.hamburg.de/radschnellwege/15310310/radschnellweg-lueneburg-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15310408/mediathek-radschnellweg-lueneburg-hamburg/"},
      {"Infos zum Elbinselquartier auf Wilhelmsburg",
       "https://www.iba-hamburg.de/de/projekte/elbinselquartier/uebersicht"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> nach Lüneburg ist abgeschlossen. An einigen Stellen sind alternative Führungen im Gespräch und müssen noch genauer abgewägt werden. Die genaue Planung für die einzelnen Abschnitte ist ebenfalls noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung.</p>
    <p>Das Video orientiert sich an der Vorzugsführung, muss aber bei Neubauabschnitten davon abweichen. Im unausgebauten Zustand stellt diese Führung nicht unbedingt die bequemste oder schnellste Verbindung bereit.</p>

    <h4>Hamburg</h4>
    <p>Los geht's an der <.m bounds="10.019518,53.530693,10.022218,53.532618" lon="10.020984" lat="53.531908" dir="forward">Freihafenelbbrücke</.m> auf die Veddel. Dort soll ein neuer Radweg zwischen Straße und Bahnschienen gebaut werden. Dieser schließt über die <.m bounds="10.015016,53.524331,10.015016,53.524331" lon="10.015016" lat="53.524331" dir="forward">existierende Unterführung</.m> an die <.a href="/alltagsroute-11">Alltagsroute 11</.a> an.</p>

    <p>Im Verlauf soll eine neue Brücke über den <.m bounds="9.99917,53.514368,10.002969,53.516183" lon="10.000917" lat="53.51554" dir="forward">Ernst-August-Kanal</.m> den KFZ-Verkehr umgehen. Durch den Bau des „Elbinselquartier“ verschiebt sich der Radweg leicht, bleibt im Wesentlichen aber gleich. Zum Umgehen des KFZ-Verkehrs auf der <.m bounds="9.994857,53.496286,10.001501,53.501032" lon="10.000374" lat="53.498406" dir="forward">Mengestraße</.m> ist eine Brücke angedacht; beim <.m bounds="9.995266,53.476934,9.997737,53.478377" lon="9.99688" lat="53.477969" dir="forward">König-Georg-Deich</.m> eine Unterführung.</p>

    <p>Am <.m bounds="9.986422,53.454653,9.995066,53.460005" lon="9.989457" lat="53.457391" dir="forward">Bahnhof Harburg</.m> knickt die Route ab. Erst langfristig könnte hier eine weitere Brücke die „Schikane“ reduzieren. Nach dem Queren der Gleise soll ein Zweirichtungsweg auf der Bahnseite anschließen. Im weiteren Verlauf sind je nach genauer Situation Fahrradstraßen (mit KFZ) oder eigenständige Fuß- und Radwege vorgesehen.</p>

    <h4>Seevetal</h4>
    <p>Die Fahrradstraße soll am <.m bounds="10.030169,53.420931,10.03996,53.425745" lon="10.034369" lat="53.423589" dir="forward">Rehmendamm</.m> kurz unterbrochen werden. Durch eine Mittelinsel soll queren dennoch möglichst einfach werden. Im Anschluss wechseln sich wieder Fahrradstraßen, eigenständige Radwege und Zweirichtungsradwege ab.</p>

    <h4>Stelle</h4>
    <p>Auf Steller Gebiet sollen die vorhandenen Wege zu Fahrradstraße ausgebaut bzw. umgewidmet werden. Um die Führung zwischen <.m bounds="10.126413,53.367925,10.148825,53.376885" lon="10.131133" lat="53.374936" dir="forward">Achterdeich und Bahnhof Ashausen</.m> zu verbessern soll an der Lüneburger Straße eine neue Unterführung gebaut werden und der Weg parallel zur Bahn entsprechend verlängert werden.</p>

    <h4>Winsen</h4>
    <p>Man überlegt die <.m bounds="10.175312,53.358699,10.187797,53.363447" lon="10.177369" lat="53.361464" dir="forward">Schikane</.m> zu entschärfen, indem man den Weg parallel zur Bahn verlängert. Beide Varianten wären Fahrradstraßen. Ab dem <.m bounds="10.186019,53.35923,10.192699,53.362105" lon="10.188124" lat="53.360621" dir="forward">Scharmbecker Weg</.m> sollen Zweirichtungsradwege gebaut werden, die sich an der <.m bounds="10.201603,53.356161,10.204391,53.358345" lon="10.2023" lat="53.35747" dir="forward">Kreuzung mit dem Schloßring</.m> in gewöhnliche Radfahrstreifen auf jeder Seite aufteilen.</p>

    <p>Am <.m bounds="10.23951,53.345204,10.248853,53.350815" lon="10.243619" lat="53.347931" dir="forward">Heidlandsweg</.m> werden beide Fahrtrichtungen wieder gemeinsam geführt. Zunächst auf einer Fahrradstraße, ab der <.m bounds="10.239856,53.315053,10.256207,53.323643" lon="10.246088" lat="53.31868" dir="forward">Radbrucher Straße</.m> als Zweirichtungsradweg.</p>

    <p>Die genaue Führung in Winsen ist noch offen. Die noch im Gespräch befindlichen Alternativen sind in der Karte eingezeichnet. Eine Kombination der verschiedenen Abschnitte ist ebenfalls denkbar.</p>

    <h4>Radbruch und Bardowick</h4>
    <p>In <.m bounds="10.278749,53.306058,10.304067,53.313474" lon="10.289963" lat="53.309597" dir="forward">Radbruch</.m> und am <.m bounds="10.354229,53.287796,10.370962,53.295145" lon="10.357704" lat="53.293127" dir="forward">Ortseingang Bardowick</.m> reicht der Platz nicht aus, um den Radschnellweg gut auszubauen. Stattdessen soll dort ein „baulicher Mittelstreifen" angelegt werden. Versuche in den Niederlanden hatten gezeigt, das diese Maßnahme bereits zu größerem Überholabstand führe.</p>

    <p>Am <.m bounds="10.367495,53.288287,10.375474,53.290624" lon="10.368537" lat="53.289318" dir="forward">Vögelser Weg</.m> soll ein 3m breiter Zweirichtungsradweg auf der Südseite der Straße angelegt werden, was auf Grund des Platzmangels die beste Lösung darstelle. Mittelinseln sollen jeweils das Queren zum Bahnhof bzw. entlang des Schnellwegs erleichtern. Der Zweirichtungsweg geht nahtlos in einen eigenständigen Radweg über.</p>

    <h4>Lüneburg</h4>
    <p>In den geschlossenen Siedlungen sollen Fahrradstraßen eingerichtet werden, an den Strecken ohne Häuser eigenständige Zweirichtungsradwege. Der Radschnellweg mündet an der <.m bounds="10.403081,53.268036,10.406128,53.269831" lon="10.40482" lat="53.2687" dir="forward">Hamburger Straße</.m> in das städtische Radwegnetz. Um gut queren zu können soll eine Ampel gebaut werden, die idealerweise herannahende Radfahrende erkennt und rechtzeitig auf Grün schaltet.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
