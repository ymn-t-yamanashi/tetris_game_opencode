defmodule Tetris.Tetromino do
  @moduledoc """
  Represents a tetromino piece.
  """
  defstruct shape: :i,
            rotation: 0,
            position: {5, 0}

  @doc "Create a new tetromino with default state"
  def new() do
    %__MODULE__{}
  end

  @doc "Move piece left by one cell if within bounds"
  def move_left(%__MODULE__{position: {x, y}} = piece) when x > 0 do
    %{piece | position: {x - 1, y}}
  end

  def move_left(piece), do: piece

  @doc "Move piece right by one cell if within bounds (width 10)"
  def move_right(%__MODULE__{position: {x, y}} = piece) when x < 9 do
    %{piece | position: {x + 1, y}}
  end

  def move_right(piece), do: piece

  @doc "Move piece down by one cell if within bounds (height 20)"
  def move_down(%__MODULE__{position: {x, y}} = piece) when y < 19 do
    %{piece | position: {x, y + 1}}
  end

  def move_down(piece), do: piece

  @doc "Rotate piece clockwise (modulo 4)"
  def rotate(%__MODULE__{rotation: r} = piece) do
    %{piece | rotation: rem(r + 1, 4)}
  end

  def move_left(piece), do: piece

  @doc "Move piece right by one cell if within bounds (width 10)"
  def move_right(%__MODULE__{position: {x, y}} = piece) when x < 9 do
    %{piece | position: {x + 1, y}}
  end

  def move_right(piece), do: piece

  @doc "Move piece down by one cell if within bounds (height 20)"
  def move_down(%__MODULE__{position: {x, y}} = piece) when y < 19 do
    %{piece | position: {x, y + 1}}
  end

  def move_down(piece), do: piece

  @doc "Rotate piece clockwise (modulo 4)"
  def rotate(%__MODULE__{rotation: r} = piece) do
    %{piece | rotation: rem(r + 1, 4)}
  end

  @shapes [:i, :o, :t, :s, :z, :j, :l]

  @doc "Generate a random tetromino.
"
  def random() do
    shape = Enum.random(@shapes)
    %__MODULE__{shape: shape}
  end
end
