defmodule Data.Article.Blog.Hoegenstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-2-hoegenstrasse"
  def created_at(), do: ~D[2018-10-30]

  def title(), do: "Högenstraße (Veloroute 2)"

  def start(), do: ~d[2019Q3]

  def type(), do: :finished

  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.936208,53.578462,9.93884,53.588592">Högenstraße</.m> soll zu einer Fahrradstraße umgebaut werden. Dies dürfte die bereits jetzt angenehm zu befahrende Strecke noch besser machen, da die verbleibenden Probleme gelöst werden. Etwa war die Querung des stärker befahrenen <.m bounds="9.936479,53.582005,9.947509,53.583196">Steenwisch</.m> nicht immer einfach. In Zukunft wird ein kleiner Kreisel dieses Problem lösen und vermutlich eine Weiterfahrt ohne Anhalten ermöglichen. Vom <.m bounds="9.933571,53.57787,9.941513,53.584227">Langenfelder Damm</.m> bis zum <.m bounds="9.936479,53.582005,9.947509,53.583196">Steenwisch</.m> soll auch „Anlieger frei“ gelten, sodass der KFZ-Durchgangsverkehr hoffentlich weiter sinkt.</p>
    <p><s>Am nördlichen Ende soll der Übergang zum <.m bounds="9.933066,53.588584,9.938297,53.59261">Spannskamp</.m> verbessert werden und der Weg einen neuen Belag erhalten.</s> Der Umbau des Übergangs zum <.m bounds="9.933066,53.588584,9.938297,53.59261">Spannskamp</.m>s soll jetzt erst mit der Erschließung erfolgen – es ist unklar, wann das passiert (<.a href="https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1004085">vgl. Drucksache 20-3247</.a>).</p>
    <p>Geplant ist der Umbau ab Sommer 2019.</p>
    <ul>
    <li><.a href="https://www.hamburg.de/contentblob/9223346/09c5a4f1dae49706ebcefdb84f69d483/data/hoegenstrasse-buergerinfo310517.pdf">Präsentation zum Umbau, mit vorläufigen Lageplänen</.a></li>
    <li><.a href="https://www.hamburg.de/eimsbuettel/hoegenstrasse/">Infoseite der Stadt zur Högenstraße</.a></li>
    <li>
    Hochauflösende, vorläufige Lagepläne:
    <ul>
      <li><.a href="https://www.hamburg.de/contentblob/9223422/d6d6e4f077af409945339b0f160a3f68/data/hoegenstrasse-vereinfachter-lageplan1.pdf">Teil 1 (Langenfelder Damm bis Vehrenkampstraße)</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/9223424/a05864f7b2ee3440be75b34ad39b178f/data/hoegenstrasse-vereinfachter-lageplan2.pdf">Teil 2 (Vehrenkampstraße bis Schrebergärten)</.a></li>
      <li><.a href="https://www.hamburg.de/contentblob/9223426/cff64fe5711adaad6d2b0e106a6d5571/data/hoegenstrasse-vereinfachter-lageplan3.pdf">Teil 3 (Schrebergärten bis Spannkamp)</.a></li>
    </ul>
    </li>
    <li><.a href="https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1004085">Änderungen der ursprünglichen Planung (29.10.2018)</.a></li>
    </ul>
    """
  end
end
