defmodule Data.Article.Blog.BleickenalleeOst do
  use Article.Default

  def created_at(), do: ~D[2019-12-05]

  def title(), do: "Bleickenallee Ost (Veloroute 1)"

  def start(), do: ~d[2020-08-21]
  def stop(), do: ~d[2020-12-18]

  def type(), do: :finished
  def construction_site_id_hh(), do: [11180]
  def tags(), do: ["1", "a11.1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>In diesem Teilabschnitt der Bleickenallee stehen dem Radverkehr nur schmale Radfahrstreifen zur Verfügung. Zudem verlaufen diese direkt neben parkenden Autos, sodass die Gefahr besteht eine Autotür in die Nase geknallt zu bekommen.</p> <p>Der Umbau sieht daher wenig überraschend breitere Radfahrstreifen (rund 2m) und ein wenig mehr Sicherheitsabstand zu den Parkplätzen (60cm) vor. Dies geschieht auf Kosten der Fußwege, auf denen die Absperrungen gegen Falschparker entfernt werden um nicht ganz so viel Platz zu verlieren. Im Gegenzug werden ordentliche Fahrradanlehnbügel geschaffen, die gleichzeitig auch die Sichtbereiche von Einfahrten gegen Falschparker sichern. </p> <p>Für den Radverkehr ist die Planung gut. Der Fußverkehr hat nur den Schwachen Trost, das mit ordentlicher Radinfrastruktur evtl. der hohe Anteil an Gehwegradlen abnimmt – bei einer Verkehrszählung waren dies rund 88% aller gezählten Radfahrenden. Leider wird nicht angegeben, wie viele davon Kinder der naheliegenden Schulen waren, die dies dürfen bzw. je nach Alter sogar müssen.</p> <p>Hintergrund warum so geplant wurde ist, das man die Bäume im Mittelstreifen erhalten wollte. Daher lässt sich der Bordstein dort nicht versetzen. Danach sind 3,25m Fahrbahn nötig, auch wegen dem Busverkehr. Die Parkplätze wollte man ebenso möglichst erhalten. Entsprechend wurde der verbleibende Platz wie oben genannt auf Fuß- und Radwege verteilt.</p> <p>Geplant ist der Umbau für 2020.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009957">Erläuterungsbericht und Lagepläne</.a> (unter Anlagen)</p>
    """
  end
end
