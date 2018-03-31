defmodule InfinityOnePagesWeb.HelpController do
  use InfinityOnePagesWeb, :controller

  plug(:put_layout, {InfinityOnePagesWeb.LayoutView, "help.html"})

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    render(conn, id <> ".html")
  end

end
