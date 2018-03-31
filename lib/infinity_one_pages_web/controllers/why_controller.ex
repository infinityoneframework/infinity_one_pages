defmodule InfinityOnePagesWeb.WhyController do
  use InfinityOnePagesWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
