defmodule Data.Article.Blog.Waterloostrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-28]

  def title(), do: "Waterloostraße (Veloroute 13)"

  def start(), do: ~d[2021-08-16]
  def stop(), do: ~d[2022-04-30]

  def type(), do: :construction
  def construction_site_id_hh(), do: [23862]
  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell macht die <.m bounds="9.952443,53.56613,9.957778,53.567351">Waterloostraße</.m> keinen Spaß – das Kopfsteinpflaster ist holprig und die vielen Falschparker wirken ebenfalls nicht einladend. Überraschenderweise ist der Radverkehr trotz dieser Widrigkeiten hoch: rund 1300 Fahrräder wurden gezählt, die Autonutzung war mit 1600 nur unwesentlich höher.</p> <p>Irgendwann 2021 soll die Straße zu einer Fahrradstraße (mit „Anlieger frei") umgebaut werden. Die Oberfläche wird asphaltiert und rund 4,5m breit. Zu den Parkplätzen gibt es zusätzliche Sicherheitsabstände. Die Parkplätze werden neu so geplant, dass sie nicht mehr auf den Fußweg ragen und den Fußverkehr dann nicht mehr behindern. Auch neue Querungshilfen werden geschaffen und an den einmündenden Straßen wird der Fußweg durchgängig gebaut, was der Fahrradstraße auch Vorfahrt verschafft. Anlehnbügel für Fahrräder kommen hinzu, ebenso werden ordentliche Sitzbänke aufgestellt.</p> <p>Eine Durchfahrtssperre für KFZ <.m bounds="9.954285,53.566553,9.95532,53.566972" lon="9.9549171" lat="53.5667373" dir="forward">zwischen Waterloohain und Heinrichstraße</.m> wurde leider abgelehnt. Als Begründung führt man den bereits geringen KFZ-Verkehr an. Ebenso bleibt die <.m bounds="9.954174,53.566739,9.957474,53.567495" lon="9.9564599" lat="53.5670602" dir="forward">Bodenwelle kurz vor der Eimsbütteler Chaussee</.m>.</p> <p>Kurzum: eine gelungene Planung. Diese muss aber noch abgestimmt werden, bevor sie tatsächlich so umgesetzt wird. In diesem Rahmen wird auch der genaue Bautermin geplant.</p> <ul>
    <li><.a href="https://lsbg.hamburg.de/contentblob/13944178/b7056a8d4de8d0cd0a3e53863a1a47e2/data/veloroute-13-waterloostrasse-abstimmungsunterlage-plan.pdf">Lageplan des Entwurfs</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/13944176/04f3018f865fdb69d06daa3e13b5ca3b/data/veloroute-13-waterloostrasse-abstimmungsunterlage-bericht.pdf">Erläuterungsbericht</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15323570/d65db8bc4db0de8e864ed9e7470e15e3/data/waterloostrasse-veloroute-13-08-21-bis-03-22.pdf">Baustellen Info August 2021</.a></li>
    </ul>
    """
  end
end
