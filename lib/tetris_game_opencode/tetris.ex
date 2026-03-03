defmodule TetrisGameOpencode.Tetris do
  @moduledoc false

  defmodule GameField do
    @moduledoc """
    Represents the Tetris field grid.
    """
    defstruct width: 10, height: 20, cells: []

    def new() do
      %__MODULE__{cells: List.duplicate(0, 200)}
    end
  end

  defmodule Tetromino do
    @moduledoc """
    Represents a falling piece.
    """
    defstruct shape: :i, rotation: 0

    def random() do
      %__MODULE__{shape: Enum.random([:i, :j, :l, :o, :s, :t, :z]), rotation: 0}
    end

    def move_left(piece) do
      piece
    end

    def move_right(piece) do
      piece
    end
  end
end
