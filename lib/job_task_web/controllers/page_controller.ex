defmodule JobTaskWeb.PageController do
  use JobTaskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
