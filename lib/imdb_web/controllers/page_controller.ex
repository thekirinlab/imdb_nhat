defmodule ImdbWeb.PageController do
  use ImdbWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
