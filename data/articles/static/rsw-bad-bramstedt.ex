defmodule Data.Article.Static.RSWBadBramstedt do
  use Article.Static

  def id(), do: "rsw-bad-bramstedt"
  def route_group(), do: :rsw
  def title(), do: "Radschnellweg nach Bad Bramstedt"

  def color(), do: "#000000"

  def summary(),
    do:
      "Beschreibung und Video zum geplanten Radschnellweg HH-Sengelmannstraße ↔ Bad Bramstedt (Vorzugsstrecke)"

  def tags(), do: [id(), "rsw"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radschnellweg Bad Bramstedt",
        direction: :forward,
        from: "Hamburg Sengelmannstraße",
        to: "Bad Bramstedt",
        parent_ref: __MODULE__,
        text: "künftiger Radschnellweg nach Bad Bramstedt",
        videos: [
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011787", "00:00:56.423", :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011788", :start, :end},
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011789", :start, "00:00:05.606"},
          {"2021-09-09-rsw-bad-bramstedt/GX012752", "00:00:01.335", "00:00:38.038"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011432", "00:01:38.332", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011433", :start, "00:00:01.201"},
          {"2021-09-09-rsw-bad-bramstedt/GX012753", "00:00:24.892", :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012754", :start, "00:00:14.681"},
          {"2021-09-09-rsw-bad-bramstedt/GX012761", "00:00:14.548", :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012762", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012763", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012764", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012765", :start, "00:00:09.009"},
          {"2021-09-09-rsw-bad-bramstedt/GX012767", "00:00:01.001", :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012768", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012769", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012771", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012772", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012773", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012774", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012776", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012777", :start, "00:00:33.433"},
          {"2021-09-09-rsw-bad-bramstedt/GX012778", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012779", :start, "00:00:55.255"},
          {"2021-09-09-rsw-bad-bramstedt/GX012779", "00:01:13.273", :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012780", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012781", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012782", :start, :end},
          {"2021-09-09-rsw-bad-bramstedt/GX012783", :start, "00:01:41.101"},
          {"2021-09-09-rsw-bad-bramstedt/GX012785", "00:00:14.381", "00:02:58.512"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"offizielle Seite zu den Radschnellwegen",
       "https://metropolregion.hamburg.de/radschnellwege/"},
      {"Detailseite zum Radschnellweg Bad bramstedt",
       "https://metropolregion.hamburg.de/radschnellwege/15303660/radschnellweg-bad-bramstedt-hamburg/"},
      {"Pläne und Berichte",
       "https://metropolregion.hamburg.de/radschnellwege/15303686/radschnellweg-bad-bramstedt-hamburg-mediathek/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Trassenfindung für einen möglichen <.ref>Radschnellweg</.ref> nach Bad Bramstedt ist abgeschlossen. An einigen Stellen sind alternative Führungen im Gespräch und müssen noch genauer abgewägt werden. Die genaue Planung für die einzelnen Abschnitte ist ebenfalls noch offen, entsprechend gibt es auch keinen Zeithorizont zur Umsetzung.</p>
    <p>Das Video orientiert sich an der Vorzugsführung, muss aber bei Neubauabschnitten davon abweichen. Im unausgebauten Zustand stellt diese Führung nicht unbedingt die bequemste oder schnellste Verbindung bereit.</p>

    <h4>Hamburg</h4>
    <p>Der geplante Radschnellweg beginnt auf der <.m bounds="10.019896,53.60821,10.027306,53.611269" lon="10.024434" lat="53.610064" dir="forward">Höhe der U-Bahn Station Sengelmannstraße</.m>. Zunächst orientiert sich die Trasse am Straßennetz und soll nach der U-Bahn Station Klein Borstel mittels einer Rampe auf die Höhe der Schienen geführt werden. Ab hier soll der Weg bis kurz vor die Station Ochsenzoll neben der U-Bahn verlaufen. Vorzugsweise würde der Weg am <.m bounds="10.009563,53.676296,10.014312,53.679305"  lon="10.012504" lat="53.677207" dir="forward">Foßberger Moor</.m> wieder ins Straßennetz überführt. Die alternative Führung wäre ein Tunnel unter dem gesamten Gebiet.</p>

    <h4>Norderstedt</h4>
    <p>Die Trasse für beide Richtungen verläuft westlich der Langenhorner Chaussee. Über eine neue Rampe erreicht man die <.m bounds="9.999541,53.681996,10.001898,53.683192">Unterführung</.m>. Der vorhandene Weg soll ausgebaut werden und ab dem <.m bounds="10.001349,53.684638,10.003863,53.685858" lon="10.002307" lat="53.684986" dir="forward">Ossenmoorgraben</.m> links der Baumreihe verlaufen. Nahe <.m bounds="10.00778,53.697603,10.015621,53.702927" lon="10.01001" lat="53.697779" dir="forward">des Waldstücks</.m> am Exerzierplatz ist dies nicht mehr so leicht möglich, daher ist der Radschnellweg von hier bis grob <.m bounds="10.015788,53.702859,10.02271,53.705313" lon="10.019211" lat="53.703343" dir="forward">Höhe Rominterer Weg</.m> nur in reduzierter Breite vorgesehen. Von dort an verläuft er wieder in voller Breite nahe der KFZ-Fahrbahn.</p>
    <p>Um zum „<.m bounds="10.022209,53.741039,10.024521,53.743164" lon="10.023228" lat="53.741885" dir="forward">Beim Brüderhof</.m>“ zu gelangen, ist eine neue Unterführung angedacht. Danach soll ein neuer Weg anschließen bzw. der vorhandene Fußweg entsprechend verbreitert werden.</p>


    <h4>Henstedt-Ulzburg</h4>
    <p>Im Mischverkehr mit den KFZ durchquert man <.m bounds="9.978212,53.746666,10.013226,53.761888" lon="9.999668" lat="53.752562" dir="forward">Rhen</.m>. Entlang der Hamburger Straße wird der vorhandene Radweg bzw. Waldweg ausgebaut. In <.m bounds="9.964906,53.763064,9.994938,53.782758" lon="9.971941" lat="53.771064" dir="forward">Ulzburg Süd</.m> und <.m bounds="9.962986,53.783783,9.990474,53.801746" lon="9.976451" lat="53.791548" dir="forward">Henstedt-Ulzburg</.m> soll die Trasse hauptsächlich als Fahrradstraße geführt werden. Vorhandene Rad- bzw. Fußwege ohne Autoverkehr werden ausgebaut, bleiben aber autofrei. Im <.m bounds="9.97815,53.78179,9.98643,53.786403" lon="9.980094" lat="53.784477" dir="forward">Pinnau-Biotop</.m> soll ein neuer Weg die Verbindung verbessern.</p>
    <p>Die genaue Führung durch das <.m bounds="9.955285,53.796059,9.979088,53.813706" lon="9.972561" lat="53.802371" dir="forward">Industriegebiet</.m> ist noch offen. Je nach gewählter Variante würde der Radschnellweg im Mischverkehr mit KFZ verlaufen, als Zweirichtungsweg entlang der Straßen oder eigenständiger Rad- und Fußweg.</p>

    <h4>Kaltenkirchen</h4>
    <p>Auf einer Neubaustrecke soll der Radweg „hinter“ dem Industriegebiet vorbeiführen. Vorhandene Rad- und Fußwege sollen ausgebaut werden. Abschnitte die auch von KFZ befahren werden sollen zu bevorrechtigten Fahrradstraßen werden. Am <.m bounds="9.953289,53.826064,9.95587,53.827795" lon="9.954674" lat="53.826755" dir="forward">Krückauring</.m>, der <.m bounds="9.942715,53.832491,9.947072,53.835187" lon="9.944162" lat="53.834026" dir="forward">Barmstedter Straße</.m> und der <.m bounds="9.945627,53.834155,9.949496,53.83619" lon="9.947071" lat="53.83491" dir="forward">Norderstraße</.m> sollen Kreisel gebaut werden; an der <.m bounds="9.946182,53.829762,9.948787,53.831387" lon="9.947353" lat="53.830451" dir="forward">Alvesloher Straße</.m> soll dagegen eine Ampel den Verkehr regeln.</p>
    <p>Ab grob der <.m bounds="9.942943,53.839446,9.948144,53.842345" lon="9.944304" lat="53.840312" dir="forward">Bahn Station Holstenterme</.m> soll bevorzugt ein neuer Weg entlang der Bahntrasse gebaut werden, der auf die <.m bounds="9.920642,53.85506,9.926246,53.858556" lon="9.922667" lat="53.857276" dir="forward">Alte Landstraße</.m> führt.</p>

    <h4>Kaltenkirchener Land</h4>
    <p>Bis <.m bounds="9.881137,53.868076,9.901357,53.877682" lon="9.898249" lat="53.870217" dir="forward">Lentföhrden</.m> sollen alle Straßen als Fahrradstraßen ausgebaut werden. Dort wird angedacht den Radschnellweg über eine neue Brücke und über den Wiesengrund zu führen. Entlang der Kieler Straße sollen gewöhnliche <.ref>Radfahrstreifen</.ref> angelegt werden. Die <.m bounds="9.881458,53.880592,9.889908,53.883789" lon="9.886955" lat="53.882126" dir="forward">Einmündung der Norderstraße</.m> soll zu einem Kreisverkehr werden und der Radschnellweg außerorts wieder gemeinsam auf der westlichen Seite geführt werden.</p>

    <h4>Bad Bramstedt</h4>
    <p>Die Trasse soll weiterhin gemeinsam westlich der KFZ-Fahrbahn verlaufen. Dazu soll der Arm des Kreisel in der <.m bounds="9.8801,53.907345,9.883402,53.908915" lon="9.881728" lat="53.908" dir="forward">Holsatenallee</.m> umgebaut werden. Die bevorzugte Führung wäre ein geradliniger Übergang zur <.m bounds="9.880598,53.911521,9.882916,53.912914" lon="9.881335" lat="53.911712" dir="forward">Altonaer Straße</.m>, die zu einer Fahrradstraße werden soll. Am <.m bounds="9.882009,53.91666,9.88387,53.918055" lon="9.882999" lat="53.917288" dir="forward">Bleeck</.m> beginngt bzw. endet der Radschnellweg.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
