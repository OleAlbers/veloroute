defmodule Article.Renderer do
  use Phoenix.LiveView

  def render(%{current_page: p} = assigns) when not is_nil(p) and is_atom(p) do
    body = assigns.current_page.text(assigns)
    has_header = body.static |> List.first() |> String.starts_with?("<h3")
    header = if !has_header, do: ~H"<h3><%= @current_page.title() %></h3>"

    assigns =
      assign(assigns, %{
        body: body,
        header: header
      })

    ~H"""
      <%= @header %>
      <Components.TagHelpers.construction_duration_header article={@current_page}/>

      <%= @body %>
      <Components.TagHelpers.article_updated_at article={@current_page}/>

      <Components.RelatedArticlesHelper.related_articles article={@current_page}/>
    """
  end
end
