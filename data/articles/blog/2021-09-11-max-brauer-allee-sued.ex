defmodule Data.Article.Blog.MaxBrauerAlleeSued do
  use Article.Default

  def created_at(), do: ~D[2021-09-11]

  def title(), do: "Max-Brauer-Allee Süd (Velorouten 1 und 12)"

  def summary(),
    do:
      "Durchgängige, mindestens 2m breite Radfahrstreifen, wo möglich durch Bordsteine vom KFZ-Verkehr getrennt. Führung zum Altonaer Balkon endlich verständlich. Bau frühestens 2023."

  def start(), do: ~d[2023-03]
  def stop(), do: ~d[2024-11]
  def type(), do: :planned

  def tags(), do: ["1", "12"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Im Verlauf der Veloroute sind teilweise <.ref>Hochbordradwege</.ref> vorhanden, die alle eher schmal sind. Ihre Oberflächen sind unterschiedlich und stellenweise sehr uneben. In der Max-Brauer-Allee selbst gibt es im Bereich der Veloroute gar keine eigenen Radwege.</p>
    <p>Bei den anderen Strecken im Planungsgebiet sieht es ähnlich aus. Zusätzlich ist die Führung je nach Ziel unklar, sodass man gute Ortskenntnisse braucht um sich nicht zu verfahren.</p>
    <h4>Planung</h4> <p>Die genaue Ausführung unterscheidet sich je nach Straße und Fahrtrichtung. Kurz gefasst sind alle Radwege mindestens 2,0m breit und wo möglich physisch vom Autoverkehr getrennt. An den Kreuzungen bleiben die Radwege rechts der KFZ-Spuren, Links abgebogen werden kann <.ref>indirekt</.ref>. Der Platz für die Radwege wird hauptsächlich durch eine Umwandlung einer KFZ-Spur gewonnen. Die alten Radwege werden zu Fußwegen, die dadurch ebenfalls breiter werden. Zusätzlich werden noch zahlreiche Radanlehnbügel installiert.</p>
    <h5>Max-Brauer-Allee Fahrtrichtung Nord</h5> <p>Ab der <.m bounds="9.935003,53.545947,9.937346,53.546786">Palmaille</.m> beginnt ein 2,0m breiter <.ref>Radfahrstreifen</.ref>, der ab der <.m bounds="9.935382,53.546967,9.9373,53.54763">Alten Königstraße</.m> durch Bordsteine von den KFZ-Spuren getrennt wird (<.ref>Protected-Bike-Lane</.ref>). Nach <.m bounds="9.935524,53.547523,9.936698,53.548382" lon="9.936302" lat="53.547981" dir="forward" ref="12">der Kreuzung mit der Königstraße</.m> wird auf einen <.ref>Kopenhagener Radweg</.ref> aufgeleitet. Dieser wird für die <.m bounds="9.935172,53.549812,9.937291,53.550783" lon="9.936291" lat="53.550093" dir="forward" ref="12">Kreuzung mit der Ehrenbergstraße</.m> unterbrochen, ist sonst aber durchgängig.</p>
    <h5>Max-Brauer-Allee Fahrtrichtung Süd</h5> <p>Zunächst fährt man auf einem 2,0m breiten Radfahrstreifen, der um die <.m bounds="9.935172,53.549812,9.937291,53.550783" lon="9.936075" lat="53.550531" dir="forward" ref="13">Kreuzung mit der Ehrenbergstraße</.m> herum als <.ref>Protected-Bike-Lane</.ref> gebaut wird. Die KFZ-Parkplätze auf dem <.m bounds="9.934516,53.54758,9.936504,53.550417">„Platz der Republik“</.m> bleiben erhalten, sodass in diesem Bereich keine extra Schutzmaßnahmen umgesetzt werden. Vor der <.m bounds="9.935391,53.547372,9.936959,53.548132">Kreuzung mit der Königstraße</.m> gibt es jedoch wieder trennende Bordsteine. Bis zur Palmaille bleibt es wegen einer Bushaltestelle wieder beim gewöhnlichen Radfahrstreifen. Man kann problemlos an wartenden Bussen vorbeifahren ohne auf die KFZ-Spur ausweichen zu müssen.</p> <p>Zum Erreichen der <.m bounds="9.932798,53.545513,9.936585,53.546578">Kaistraße</.m> wird es zwei Möglichkeiten geben. Entweder man fährt über den <.m bounds="9.934104,53.546237,9.936255,53.546785">Parkplatz südlich des Rathauses</.m> und biegt dann indirekt links ab. Die Kreuzung wird dazu entsprechend angepasst und erhält eine eigene Radampel. Die andere Möglichkeit erlaubt das Abbiegen über die KFZ-Spuren, sofern man sich rechtzeitig einordnet. Im Kreuzungsbereich auf der Palmaille steht dann ein mit Bordsteinen geschützter <.ref>Radfahrstreifen in Mittellage</.ref> zum Aufstellen bereit. Diese Möglichkeit ist vermutlich für Radverkehr aus der Palmaille gedacht, da man von dort den Parkplatz nicht erreichen kann.</p>
    <h5>Ottenser Marktplatz / Königstraße</h5> <p>Auf der <.m bounds="9.934382,53.547437,9.936481,53.548019">Ottenser Seite</.m> gibt's 2,0m breite Radfahrstreifen, die durch Bushaltestellen unterbrochen werden. Es bleibt genug Platz um an wartenden Bussen auch bei KFZ-Stau vorbeizufahren. Auf der <.m bounds="9.935883,53.547532,9.937885,53.547937">Altonaer Seite</.m> wird der Radfahrstreifen durch Bordsteine abgetrennt sofern dies durch Einfahrten, KFZ-Parkplätze oder zu wenig Platz nicht verhindert wird.</p>
    <h5>Lohbuschstraße / Ehrenbergstraße</h5> <p>Auf der <.m bounds="9.934501,53.550048,9.936544,53.550443" lon="9.934789" lat="53.550271" dir="forward" ref="1">Ottenser Seite</.m> gibt's zunächst Radfahrstreifen, die in Richtung Kreuzung jedoch zu Protected-Bike-Lanes werden. In der <.m bounds="9.936164,53.54978,9.94126,53.550453">Ehrenbergstraße</.m> wird dies nur auf der Nordseite (Fahrtrichtung Ottensen) umgesetzt, da die Südseite (Fahrtrichtung Innenstadt) zu viele KFZ-Parkplätze und Einfahrten besitzt. Stattdessen soll hier eine doppelte Trennlinie (ca. 50cm Breite) den Sicherheitsabstand sicherstellen. Abweichend zur sonstigen Planung bleibt der Hochbordradweg auf der Nordseite zwischen <.m bounds="9.937894,53.549903,9.941129,53.550496">Altonaer Poststraße bis Schillerstraße</.m> erhalten. Auch er wird 2,0m breit.</p>
    <h4>Meinung</h4> <p>Der erste Entwurf löst viele Probleme die der Radverkehr in diesem Bereich hat. Die Radwege sind jetzt anprechend breit, durchgängig und mit Sicherheitsabstand zu den Autos geplant. Die verständliche Führung in Richtung Altonaer Balkon (Kaistraße) war überfällig. Man war sichtlich bemüht den Radverkehr vom KFZ-Verkehr zu trennen und dies durch physische Barrieren zu verdeutlichen. Das hat nicht überall geklappt, was die Umsetzung stückhaft erscheinen lässt. Dennoch sollten die neuen Radwege ein gutes Sicherheitsgefühl anbieten und liegen definitiv über dem Niveau, das in den letzten Jahren umgesetzt wurde.</p>
    <h4>Quelle</h4> <p><.a href="https://suche.transparenz.hamburg.de/dataset/5c505467-5d63-4da6-ae12-a06167898e15">erster Entwurf im Transparenz Portal</.a></p>
    """
  end
end
