defmodule Data.Article.Blog.Holstenplatz do
  use Article.Default

  def name(), do: "#{created_at()}-13-holstenplatz"
  def created_at(), do: ~D[2018-08-29]
  def updated_at(), do: ~D[2021-08-05]
  def title(), do: "Kreuzungen um den Holstenplatz (Veloroute 13)"

  def type(), do: :planned

  def start(), do: ~d[2022-09-01]
  def stop(), do: ~d[2023-12-22]

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Um den Holstenplatz wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt. Diese sind dabei teilweise recht schmal und verlaufen durch den Haltestellenbereich der Busse. Konflikte durch Ein-/Aussteigen bzw. auf dem Radweg Wartenden sind entsprechend häufig. An der Kreuzung mit der Stresemannstraße fehlen dem Radverkehr selbst Aufstellflächen, sodass hier die Querrichtung oder der Fußweg blockiert wird.</p>

    <h4>Planung</h4>
    <p>Die bereits 2018 abgeschlossene Planung wurde nochmals überarbeitet. Im Wesentlichen bleibt das Konzept gleich, wobei sich aber Detailverbesserungen ergeben. Im Nachfolgenden wird der neuere Plan beschrieben</p>

    <p>Entlang der Veloroute 13 im Uhrzeigersinn gibt es zunächst einen <.ref>Radfahrstreifen in Mittellage</.ref>. Geradlinig wird man über eine rot eingefärbte Furt über die Holstenstraße geführt, macht dann einen Schlenker nach rechts um auf der Busspur weiterzufahren. Diese ist breit genug um auch wartende Busse zu überholen. Unter der Brücke hört die Busspur auf und die Weiterfahrt erfolgt über einen <.ref>Radfahrstreifen</.ref> der durchgehend in die Alstenstraße führt.</p>

    <p>In der entgegengesetzten Fahrtrichtung gibt es wieder einen Radfahrstreifen in Mittellage, der aber deutlich länger ist. Unter der Brücke teilt man sich die Spur mit den Bussen, wobei man sich hier je nach Fahrtrichtung einordnen muss – es gibt eine eigene Linksabbieger-Spur für den Radverkehr. Die Kreuzung quert man wieder geradlinig um in der Haubachstraße im <.ref>Mischverkehr</.ref> weiterzufahren.</p>

    <p>Bis auf die genannte Ausnahme kann nur indirekt links abgebogen werden. Die Radfahrstreifen sind meist 2,0m breit, teils schmaler, teils breiter. Anders als 2018 noch geplant werden die Bushaltestellen in der Stresemannstraße nicht in dieser Maßnahme umgebaut.</p>

    <h4>Meinung</h4>
    <p>Im Vergleich zum Bestand verbesserte die alte Planung die Situation, wobei die neue nochmal etwas oben drauf legt. Die Führung entlang der Veloroute 13 im Uhrzeigersinn ist jetzt deutlich klarer und die Breiten sind jetzt alltagstauglicher als die 1,60m Mindestmaße. Leider hält man weiterhin an den unangenehmen Radfahrstreifen in Mittellage fest und versucht dann eine Erklärung zu finden, warum diese trotzdem die bessere Wahl waren. Man sollte hier konsequent KFZ-Abbiegemöglichkeiten abschaffen, wenn sich deswegen keine ordentliche Radverkehrsführung realisieren lässt.</p>

    <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/15310052/78b267baa20992a8375a711b03e63f11/data/veloroute-13-holstenplatz-nachtrag-zur-abgestimmten-planung-plan.pdf">Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/15310050/fc0ba79d73e59dda9179f250ac15178c/data/veloroute-13-holstenplatz-nachtrag-zur-abgestimmten-planung-bericht.pdf">Erläuterungsbericht zu den Änderungen 2021</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11024280/40de1b0e8d33330964b21b4af96eedaa/data/veloroute-13-holstenplatz-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zu den Originalplänen von 2018</.a>
    </li>
    </ul>
    """
  end
end
