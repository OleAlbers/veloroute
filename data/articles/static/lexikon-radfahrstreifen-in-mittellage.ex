defmodule Data.Article.Static.LexikonRadfahrstreifenInMittellage do
  use Article.Static

  def name(), do: "lexikon/radfahrstreifen-in-mittellage"
  def title(), do: "Lexikon · Radfahrstreifen in Mittellage (RiM, Fahrradweiche)"

  def summary(),
    do: "RiMs verlaufen auf der Kreuzung zwischen den KFZ-Rechts und KFZ-Geradeaus Spuren"

  def tags(), do: ["lexikon", "radfahrstreifen-in-mittellage", "rim", "mittellage"]

  def text(assigns) do
    ~H"""
    <p><.m bounds="10.01356,53.61575,10.018941,53.617472" lon="10.0169467" lat="53.6161836" dir="forward" ref="4">Videobeispiel Kreuzung Maienweg/Semmelmannstraße</.m></p>

    <p>Umgangssprachlich als „Fahrradweiche“ bezeichnet ist ein „Radfahrstreifen in Mittellage“ eine an Kreuzungen aufgemalte Verkehrsführung. Sie packt die Geradeausspur für den Radverkehr zwischen die Geradeausspur bzw. Rechtsabbiegerspur für KFZ.
    </p>

    <.roaddiagram src="rim" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wo Radfahrstreifen in Mittellage im Kreuzungsbereich verlaufen."/>

    <p>Eine <.a href="https://nationaler-radverkehrsplan.de/de/aktuell/nachrichten/einsatzbereiche-von-radfahrstreifen-mittellage">Studie der TU Berlin</.a> kommt zum Ergebnis, das diese Führung vergleichbar mit älteren Varianten ist was Unfälle betrifft. Die Stadt einigte sich 2020 mit dem <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburg</.a> darauf, keine neuen Radfahrstreifen in Mittellage mehr zu planen. Da zwischen Planung und Umbau teils Jahre vergehen, taucht diese Variante stellenweise trotzdem noch auf (Stand: 2022).</p>
    """
  end
end
