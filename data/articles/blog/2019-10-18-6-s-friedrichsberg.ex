defmodule Data.Article.Blog.SFriedrichsberg do
  use Article.Default

  def name(), do: "#{created_at()}-6-s-friedrichsberg"
  def created_at(), do: ~D[2019-10-18]

  def title(), do: "Kreuzung am S-Bahnhof Friedrichsberg (Veloroute 6)"

  def type(), do: :planned

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die ganze Kreuzung geht nicht davon aus, das Radverkehr existiert. Stadtauswärts wird der benutzungspflichtige Zweirichtungs-Radweg auf einmal so schmal, das man <i>vermutlich</i> die Straßenseite hätte wechseln sollen. Dies ist aber weder auf Schildern noch Straßenmarkierungen ersichtlich, noch gibt es irgendeine offensichtlich beste Route. Gefährlich: Die reinen Fußampeln sind nicht für den Radverkehr optimiert und gelten seit 2017 auch nicht mehr für ihn. Sowohl Rad- als auch KFZ-Nutzende werden hier also seit Jahren falsch erzogen.</p> <p>Glücklicherweise plant der LSBG diese Kreuzung umzubauen – allerdings hängen die Planungen davon ab, ob die Stadt die dafür notwendigen Grundstücke erwerben kann. Der letzte Stand ist der erste Entwurf vom Sommer 2016, der aber schon die Eingaben aus der Bevölkerung berücksichtigt. Auf den ersten Blick wirkt die Planung für den Radverkehr sehr gut.</p> <p>Dem Entwurf nach wird der Radverkehr künftig direkt nach dem Friedrichsberger Park wieder aufgeteilt. Entlang des <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.575831, lon: 10.057333, zoom: 18})} ref="6">Eilbektal</.m> stehen pro Richtung jeweils ca. 2m Radweg zur Verfügung und zwar jeweils auf der „richtigen“ Seite der Straße. Stadtauswärts wird dafür eine weitere Radampel eingerichtet. Auf der großen Kreuzung werden die Radspuren jeweils durchgängig und geradlinig geführt. Stadtauswärts mit eigener Ampel und praktisch unabhängig vom Autoverkehr, da das Eilbektal eine Einbahnstraße bleibt und Linksabbiegen von Norden nicht vorgesehen ist. Stadteinwärts orientiert man sich an der KFZ-Ampel und stellt sich zwischen KFZ-Rechts und KFZ-Geradeaus auf, was nicht ganz so angenehm ist. In Nord/Süd Richtung (die Veloroute kreuzend) ist die Führung ebenso wie gerade beschrieben. Man fährt fast überall auf Radfahrstreifen (Asphalt, Abtrennung zu KFZ nur durch Markierungen). Ausnahme bildet hier nur der Hochbordradweg im Eilbektal stadtauswärts, da dieser „gegen die Einbahnstraße“ verläuft und man diesen Abschnitt wohl besonders gegen KFZ abtrennen wollte.</p> <p>Wann die Planung umgesetzt werden soll ist mir unbekannt. In den Präsentation wurde von einer Umsetzung ab 2018 ausgegangen, was aber offensichtlich nicht passiert ist.</p> <p><.a href="https://lsbg.hamburg.de/projekte/5100484/krausestrasse-bis-hammer-strasse/">Projektseite der Stadt zur Planung</.a> (Die Kreuzung ist im Dokument „Vorzugsvariante Planung Blatt 2 Dehnhaide - Eilbektal Stand 1. Verschickung“ beschrieben)</p>
    """
  end
end
