defmodule Tetris.TetrominoTest do
  use ExUnit.Case

  alias Tetris.Tetromino

  @shapes [:i, :o, :t, :s, :z, :j, :l]

  test "random/0 returns a Tetromino with shape in allowed list" do
    tetro = Tetromino.random()
    assert %Tetromino{} = tetro
    assert tetro.shape in @shapes
  end
end
