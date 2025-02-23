defmodule Data.Article.Blog.Heegbarg do
  use Article.Default

  def name(), do: "#{created_at()}-5-heegbarg"
  def created_at(), do: ~D[2019-04-25]

  def title(), do: "Heegbarg (Veloroute 5)"

  def start(), do: ~d[2020-07-20]
  def stop(), do: ~d[2021-03-19]

  def type(), do: :finished
  def construction_site_id_hh(), do: [10026]
  def tags(), do: ["5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im markierten Stück des <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.656266, lon: 10.093697, zoom: 18}))}>Heegbarg</.m> gibt es noch unbenutzbare Radwege im Altbestand. Sie sind viel zu schmal, uneben, ohne Sicherheitsabstände und an <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.659551, lon: 10.095399, zoom: 17}))}>der Kreuzung mit der Alsterredder</.m> nichtmal durchgängig. Auf der Fahrbahn fährt es sich dagegen sehr angenehm, was aber gerade Radneulingen schwer fallen dürfte.</p> <p>Im ersten Entwurf ist vorgesehen die alten Radwege vollständig zu entfernen. Vom <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.657917, lon: 10.09454, zoom: 17}))}>Saseler Damm bis zur Alsterredder</.m> wird ein ca. 1,7m breiter Schutzstreifen (gestrichelete Linie) angelegt. In diesem Abschnitt bleibt es beim Tempo 50.</p> <p>Im <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.660729, lon: 10.096304, zoom: 17}))}>nördlichen Teil</.m> sollen Radfahrende im Mischverkehr mit den Autos fahren, also so wie im weiteren Verlauf. Die ehemaligen Flächen des Radweges werden begrünt oder dem Fußweg zugeschlagen. Die bereits eingerichtete Tempo-30-Zone bleibt bestehen.</p> <p>Es wird ebenfalls noch überlegt ob die Tempo-30-Zone etwas erweitert werden kann, sodass die Stop-Schilder an <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.659551, lon: 10.095399, zoom: 17}))}>der Kreuzung mit der Alsterredder</.m> entfallen könnten. Zum <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.65638, lon: 10.093554, zoom: 18}))}>Saseler Damm (Ring 3)</.m> wird auf die dort bestehenden Radwege übergeleitet, d.h. diese Kreuzung ist nicht Bestandteil dieser Planung.</p> <p>Auf dem Heegbarg herrscht wenig Verkehr, sodass die vorgesehenen Maßnahmen ausreichend erscheinen. Die Qualität für Radfahrende verbessern sie definitiv.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1010194">Erläuterung und Lagepläne</.a><br> <.a href="https://www.hamburg.de/wandsbek/strassenbaustellen/14292176/heegbarg/">Infoseite der Stadt zur Baustelle</.a></p>
    """
  end
end
