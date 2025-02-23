defmodule Data.Article.Static.Freizeitroute8 do
  use Article.Static

  def id(), do: "FR8"
  def route_group(), do: :freizeit
  def title(), do: "Elbuferradweg (FR8)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 8 führt entlang des Elbufers"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Elbufer",
        direction: :forward,
        from: "Landungsbrücken",
        to: "Wedel",
        parent_ref: __MODULE__,
        text: "entang des Elbufers nach Wedel",
        videos: [
          {"2021-06-13-veloroute-5-5a-und-13rein/GX011836", :start, "00:00:10.911"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011416", "00:00:01.068", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011417", :start, "00:00:56.390"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011417", "00:01:21.048", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011418", "00:01:08.201", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021418", :start, "00:00:43.477"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Elbufer",
        direction: :backward,
        from: "Wedel",
        to: "Landungsbrücken",
        parent_ref: __MODULE__,
        text: "entlang des Elbufers zu den Landungsbrücken",
        videos: [
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011419", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021419", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011549", "00:00:00.767", "00:00:12.145"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011418", "00:00:04.972",
           "00:00:27.327"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011549", "00:01:04.097", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011550", :start, "00:04:44.384"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011510", "00:00:16.216", "00:00:27.427"},
          {"2021-08-03-fr14-noerdlich-kattwyk/GX012487", "00:00:28.529", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294580/radtour-city-elbufer-wittenbergen/"},
      {"Komoot Routenplaner: entlang des Elbufers", "https://www.komoot.de/tour/227479550"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9070354"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 8 – Elbuferradweg <.icon>FR8</.icon></h3>
    <span class="updated">Länge rund 16km (davon 1km Schiebestrecke)</span>

    <p>Die Tour beginnt an den <.m bounds="9.96592,53.545013,9.971934,53.54705" lon="9.969011" lat="53.546104" dir="forward" ref="FR8">Landungsbrücken</.m> und führt entlang der Elbe und ihren <.m bounds="9.781972,53.55639,9.804119,53.561605" lon="9.788352" lat="53.560075" dir="forward" ref="FR8">Stränden</.m> bis <.m bounds="9.696244,53.564169,9.738179,53.583198" lon="9.735015" lat="53.5655" dir="forward" ref="FR8">Wedel</.m>. Von dort kann entlang der Deiche weiter elbabwärts gefahren werden.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist zwar nicht beschildert, aber trotzdem sehr leicht zu finden – „immer der Elbe nach“. Selbst wenn man die Abschnitte die etwas weiter vom Ufer verlaufen nicht auf Anhieb findet, wirklich verfahren kann man sich nicht.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist größtenteils asphaltiert oder gepflastert, es gibt aber immer wieder fein geschotterte Abschnitte. Am <.m bounds="9.897939,53.543927,9.914757,53.545029" lon="9.907512" lat="53.54472" dir="forward" ref="FR8">Flaschenhals Övelgönne</.m> muss immer geschoben werden, auf anderen Stücken bei schönem Wetter ebenfalls. Nur am frühen Morgen oder späten Abend ist eine unterbrechungsfreie Fahrt möglich. Zu allen anderen Zeiten: steige ab, bevor es eng wird und sei exzellent zu Anderen!</p>

    <h4>Meinung</h4>
    <p>Wer es gemütlich mag oder neu in Hamburg ist, kann sich die Tour genauer ansehen. Wer vor allem Rad fahren möchte, sollte die Route frühestens ab <.m bounds="9.859689,53.54551,9.870871,53.549437" lon="9.863218" lat="53.547249" dir="forward" ref="FR8">Teufelsbrück</.m> benutzen. Von Altona bietet sich die <.m bounds="9.923566,53.547241,9.936934,53.54851">Holländische Reihe</.m>, <.m bounds="9.87914,53.547219,9.92627,53.550039">Bernadottestraße</.m>, <.m bounds="9.861326,53.546057,9.881644,53.548536">Elbchaussee</.m> als alternative Führung an. Für Rennräder ist die Tour völlig ungeeignet.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
