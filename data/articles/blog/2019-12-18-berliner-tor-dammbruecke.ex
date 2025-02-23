defmodule Data.Article.Blog.BerlinerTorDammbruecke do
  use Article.Default

  def created_at(), do: ~D[2019-12-18]

  def title(), do: "Berlinertordammbrücke (Veloroute 8)"

  def start(), do: ~d[2023]
  def stop(), do: ~d[2028]

  def type(), do: :planned

  def tags(), do: ["8"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Brücke hat ihre Lebenszeit erreicht und muss neugebaut werden. Diese soll dabei ihre aktuelle Breite behalten, d.h. nur die Spurenaufteilung verändert sich. Der Radverkehr kommt dabei gut weg – die beiden Fahrtrichtungen der Veloroute erhalten jeweils 2m Breite (statt aktuell 1,50m), ebenso wie der Radweg auf der Südseite der Brücke. Zwischen Fußweg und Radwegen auf der Nordseite soll auch ein knapp vier Meter breiter Grünstreifen angelegt werden.</p> <p>Diesen Platz holt man sich hauptsächlich durch die Halbierung des nicht befahrbahren Mittelstreifen auf 1,50m und die annähernde Halbierung des Fußwegs auf der Südseite auf 2,65m. Auch die Poller gegen Falschparker entfallen und tragen zum Platzgewinn bei.</p> <p>Zusätzlich wird an der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.553763, lon: 10.026622, zoom: 18})} ref="8">Klaus-Groth-Straße</.m> eine Ampel aufgestellt. Diese ermöglicht das sichere Queren des Berlinertordamms, soll aber auch den Rad- und Fußverkehr über die Klaus-Groth-Straße regeln. Bisher stellen aus der Nebenstraße kommende KFZ einen Unfallschwerpunkt für den Radverkehr auf der Veloroute dar, v.a. in Fahrtrichtung stadtauswärts. Es ist geplant KFZ nur auf Anforderung grün zu geben und ansonsten Rad/Fuß zu bevorrechtigen – wie eine Bettelampel, nur für KFZ.</p> <p>Da es sich um den ersten Entwurf handelt ist noch mit Änderungen zu rechnen. Neben offensichtlichen Planungsfehlern (keine Ampel für den Radverkehr am <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.55364, lon: 10.024128, zoom: 18})} ref="8">Berliner Tor</.m>), stellt sich auch die Frage warum man den südlichen Fußweg so stark verschmälert, wenn für den Mittelstreifen noch 1,50m vorgesehen sind. Leier wurde nicht untersucht ob die Klaus-Groth-Straße für KFZ gesperrt werden kann, damit der Radverkehr nicht durch eine Ampel ausgebremst wird und ggf. auch die Schikanen am Park entfallen könnten.</p> <p>Geplant ist mit Vorarbeiten 2023 zu starten und die Brücke ab 2024 bis 2028 komplett neuzubauen.</p> <p>
    <.a href="https://lsbg.hamburg.de/contentblob/13359160/c4207d47fd897ce79cf2b9a5e5ea71c4/data/berlinertordammbruecke-abstimmungsunterlage-bericht.pdf">Erläuterungen zum ersten Entwurf</.a><br>
    <.a href="https://lsbg.hamburg.de/contentblob/13359162/1ab3707d2a07e65e51bcd7b1e20dcc28/data/berlinertordammbruecke-abstimmungsunterlage-plan.pdf">Vorläufiger Lageplan</.a>
    </p>
    """
  end
end
