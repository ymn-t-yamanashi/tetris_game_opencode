defmodule Tetris.Tetromino do
  @moduledoc """
  Represents a tetromino piece.
  """
  defstruct shape: :i,
            rotation: 0,
            position: {5, 0}

  @shapes [:i, :o, :t, :s, :z, :j, :l]

  @doc "Generate a random tetromino.
"
  def random() do
    shape = Enum.random(@shapes)
    %__MODULE__{shape: shape}
  end
end
