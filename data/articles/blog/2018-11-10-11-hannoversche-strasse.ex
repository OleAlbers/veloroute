defmodule Data.Article.Blog.HannoverscheStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-11-hannoversche-strasse"
  def created_at(), do: ~D[2018-11-10]

  def title(), do: "Hannoversche Straße (Veloroute 11)"

  def start(), do: ~d[2021-01-04]
  def stop(), do: ~d[2022-05-20]

  def type(), do: :construction
  def construction_site_id_hh(), do: [14079, 17581]
  def tags(), do: ["11", "H14"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Lageplan Kreuzung Neuländer Straße", "2022",
       "https://fragdenstaat.de/anfrage/umbau-hannoversche-strae-neulander-strae/#nachricht-683575"},
      {"vorläufigem Lageplan", "2018",
       "https://sitzungsdienst-harburg.hamburg.de/bi/vo020.asp?VOLFDNR=1005817"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.988544,53.45435,9.994206,53.470173">Hannoversche Straße</.m> besitzt momentan auf fast der gesamten Länge Hochbordradwege, die jedoch durchweg zu schmal und teilweise starke Unebenheiten aufweisen. Lediglich Richtung <.m bounds="9.993877,53.471446,9.99624,53.47758">Alte Harburger Elbbrücke</.m> muss der Radverkehr sich irgendwie in den fließenden KFZ-Verkehr einordnen – die Umsetzung ist hier aber sehr unglücklich.</p>

    <p>Die vorliegende Planung löst dies besser: es soll durchgehende Radfahrstreifen von ca. 2,00m Breite geben, die so nahtlos an den Neubau <.m bounds="9.989169,53.458068,9.990202,53.458749">Hannoversche Brücke</.m> anschließen. Es gibt einige Ausnahmen: an der Kreuzung mit der <.m bounds="9.990524,53.462835,10.022999,53.466791">Neuländer Straße</.m> fährt man Richtung Norden durch den Haltebereich des Busses, wobei man sich in den KFZ-Verkehr einfädeln muss um einen wartenden Bus zu überholen. Am nördlichen Ende, also der Kreuzung mit dem <.m bounds="9.993981,53.468125,10.006082,53.470173">Neuländer Hauptdeich</.m>, der <.m bounds="9.993837,53.470145,9.99703,53.47758">Brücke des 17. Juni</.m> und der <.m bounds="9.990524,53.465614,9.993981,53.470227">Nartenstraße</.m> soll künftig ein Kreisel den Verkehr regeln. Die <.m bounds="9.9938767,53.4714464,9.9961153,53.4755551">alte Harburger Elbbrücke</.m> wird dabei direkt angeschlossen und der Radverkehr erhält dafür eigene Auf- und Abfahrten. Im Kreisel selbst herrscht Mischverkehr und Richtung Süden bleibt es bei einem kurzen Stück Hochbordradweg, da so die vorhandenen Bäume nicht gefällt werden müssen. Hier erhalten Radfahrende ebenfalls eine eigene Abfahrt.</p>

    <p>Die Kreuzung mit der <.m bounds="9.990524,53.462835,10.022999,53.466791">Neuländer Straße</.m> wird dagegen klassisch mit Ampel geregelt. Linksabbiegerspuren sind für den Radverkehr nicht vorgesehen, dafür aber großzügige Aufstellbereich für indirektes Abbiegen. Geübte Radfahrende können sich in den KFZ-Verkehr einordnen und so direkt links abbiegen. Verkehrsinseln trennen beim Rechtsabbiegen den KFZ- vom Radverkehr.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
