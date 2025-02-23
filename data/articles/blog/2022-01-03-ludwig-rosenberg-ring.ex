defmodule Data.Article.Blog.LudwigRosenbergRing do
  use Article.Default

  def created_at(), do: ~D[2022-01-03]

  def title(), do: "Ludwig-Rosenberg-Ring (Alltagsroute 8)"

  def start(), do: ~d[2022-08]
  def stop(), do: ~d[2022-12]

  def type(), do: :intent

  def summary(),
    do: "Noch 2022 sollen Radfahrstreifen eingerichtet werden."

  def tags(), do: ["8"]

  def links(_assigns) do
    [
      {"Haushaltsplan 2022 Bezirk Bergedorf (Entwurf)",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1006315"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im betrachteten Abschnitt des Ludwig-Rosenberg-Rings wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt. Es besteht aber auch die Möglichkeit auf der <.ref>Fahrbahn</.ref> zu fahren.</p>

    <h4>Vorhaben</h4>
    <p>Laut Haushaltsentwurf 2022 sollen noch im selben Jahr <.ref>Radfahrstreifen</.ref> eingerichtet werden.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
