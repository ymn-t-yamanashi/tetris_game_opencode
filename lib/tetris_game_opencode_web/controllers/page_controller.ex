defmodule TetrisGameOpencodeWeb.PageController do
  use TetrisGameOpencodeWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
