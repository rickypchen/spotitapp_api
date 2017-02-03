defmodule SpotitApp.PageController do
  use SpotitApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
