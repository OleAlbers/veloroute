defmodule Data.Article.Static.Suche do
  use Article.Static

  def title(), do: "Suche"

  def summary(),
    do: "Suche nach Straßen und Artikeln"

  def tags(), do: []

  def text(assigns) do
    assigns = assign(assigns, :search_results, combined_search(assigns))

    ~H"""
    <h3><label for="query">Suche 🔎</label></h3>
    <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="500" phx-hook="FocusSearchField" autofocus="autofocus" value={@search_query}/>

    <.noindex>
      <%= if @search_results == [] && @search_query != "" do %>
        <p>Leider keine Ergebnisse.</p>
      <% else %>
      <ul>
        <%= for result <- @search_results do %>
          <li>
            <div>
              <!-- relevance: {result.relevance} -->
              <!-- type: {result.type} -->
              <%= SearchResult.to_html(result) %>
              <%= if result.subtext do %>
                <div class="aside"><%= result.subtext %></div>
              <% end %>
            </div>
          </li>
        <% end %>
      </ul>
      <% end %>
    </.noindex>
    """
  end

  defp combined_search(%{search_query: query, search_bounds: bounds}) do
    map = Mapbox.search(query, bounds)
    art = Article.Search.search(Article.List.all(), query)

    SearchResult.sort_merge(map, art) |> Enum.take(15)
  end
end
