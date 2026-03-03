defmodule TetrisGameOpencodeWeb.GameLive do
  use TetrisGameOpencodeWeb, :live_view
  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash} current_scope={@current_scope}>
      <div id="game-field">{@field.width} x {@field.height}</div>
    </Layouts.app>
    """
  end

  use Phoenix.LiveView
  alias TetrisGameOpencode.Tetris

  @impl true
  def mount(_params, _session, socket) do
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
    {:noreply,
     socket
     |> push_event("tick", %{})}
  end

  @impl true
  def handle_event("key", %{"code" => code}, socket) do
    # simple left/right logic
    new_piece =
      case code do
        "ArrowLeft" -> Tetris.Tetromino.move_left(socket.assigns.current_piece)
        "ArrowRight" -> Tetris.Tetromino.move_right(socket.assigns.current_piece)
        _ -> socket.assigns.current_piece
      end

    {:noreply, assign(socket, :current_piece, new_piece)}
  end
end
