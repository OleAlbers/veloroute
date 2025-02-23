defmodule Data.Article.Blog.Veloroute3Bewertung do
  use Article.Default

  def created_at(), do: ~D[2018-09-03]

  def title(), do: "Bewertung der Veloroute 3 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Veloroute 3 ist in der Innenstadt deutlich besser befahrbar als in den Außenbezirken. Dort hat man entweder völlig desolate Radwege oder teilt sich die schnell befahrenen Straßen im Mischverkehr. In den Nebenstraßen mit 30 km/h ist Begegnungsverkehr dann oft schwierig, sodass man auch hier nicht zügig vorankommt.</p>
    <p>Richtung Zentrum, grob ab <.m bounds="9.968331,53.580754,9.968331,53.580754">Hoheluft-West</.m> ist die Situation deutlich entspannter: häufig gibt es schon Radfahrspuren oder die Nebenstraßen sind breit genug. Das vorm <.m bounds="9.987285,53.558986,9.993007,53.563325">Dammtor Bahnhof</.m> gerade umgebaut wird wertet die Route zwar nicht auf, lässt aber hoffen das diese Kreuzung in Zukunft angenehmer für den Radverkehr wird.</p>
    <p>Unterm Strich ist die Veloroute 3 kein Totalschaden, aber wirklich empfehlen kann man sie nicht. Zum Trost: für viele Straßen im äußeren Teil gab es bereits Infoveranstaltungen zur Umgestaltung – es sollte also bald besser werden.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215364183/Durchs-Univiertel-bis-Niendorf-noch-Luft-nach-oben.html">Zeitungsartikel/Review vom 19.09.2018</.a></p>
    """
  end
end
