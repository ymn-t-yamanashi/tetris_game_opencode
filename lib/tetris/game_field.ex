defmodule Tetris.GameField do
  @moduledoc """
  Represents the game field grid.
  The grid is a list of rows, each row is a list of cells. A cell can be `nil` (empty) or `:filled`.
  """
  @width 10
  @height 20

  defstruct width: @width,
            height: @height,
            grid: []

  @doc "Creates a new empty field.
"
  def new() do
    %__MODULE__{grid: List.duplicate(List.duplicate(nil, @width), @height)}
  end
end
