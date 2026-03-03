defmodule TetrisGameOpencodeWeb.GameLive do
  use TetrisGameOpencodeWeb, :live_view
  alias TetrisGameOpencodeWeb.Layouts

  @impl true
  def render(assigns) do
    assigns = Map.put_new(assigns, :flash, %{})

    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div id="game-field">{@field.width} x {@field.height}</div>
    </Layouts.app>
    """
  end

  alias TetrisGameOpencode.Tetris

  @impl true
  def mount(_params, session, socket) do
    socket = assign(socket, :current_scope, Map.get(session, "current_scope"))
    if connected?(socket), do: Process.send_after(self(), :tick, 1000)

    field = Tetris.GameField.new()
    current_piece = Tetris.Tetromino.random()

    {:ok,
     socket
     |> assign(:field, field)
     |> assign(:current_piece, current_piece)
     |> assign(:score, 0)
     |> assign(:level, 0)
     |> assign(:game_over?, false)}
  end

  @impl true
  def handle_info(:tick, socket) do
    {:noreply, push_event(socket, "tick", %{})}
  end

  @impl true
  def handle_event("key", %{"code" => code}, socket) do
    new_piece =
      case code do
        "ArrowLeft" -> Tetris.Tetromino.move_left(socket.assigns.current_piece)
        "ArrowRight" -> Tetris.Tetromino.move_right(socket.assigns.current_piece)
        _ -> socket.assigns.current_piece
      end

    {:noreply, assign(socket, :current_piece, new_piece)}
  end
end
