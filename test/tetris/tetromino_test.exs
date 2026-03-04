defmodule Tetris.TetrominoTest do
  use ExUnit.Case, async: true

  alias Tetris.Tetromino

  test "new creates a tetromino with default position" do
    piece = Tetromino.new()
    assert piece.position == {5, 0}
    assert piece.rotation == 0
    assert Enum.member?([:i, :o, :t, :s, :z, :j, :l], piece.shape)
  end

  test "move_left decrements x if not at left edge" do
    piece = %Tetromino{position: {5, 3}}
    moved = Tetromino.move_left(piece)
    assert moved.position == {4, 3}
  end

  test "move_left does nothing at left edge" do
    piece = %Tetromino{position: {0, 3}}
    moved = Tetromino.move_left(piece)
    assert moved.position == {0, 3}
  end

  test "move_right increments x if not at right edge" do
    piece = %Tetromino{position: {5, 3}}
    moved = Tetromino.move_right(piece)
    assert moved.position == {6, 3}
  end

  test "move_right does nothing at right edge (width-1)" do
    piece = %Tetromino{position: {9, 3}}
    moved = Tetromino.move_right(piece)
    assert moved.position == {9, 3}
  end

  test "move_down increments y if not at bottom" do
    piece = %Tetromino{position: {5, 10}}
    moved = Tetromino.move_down(piece)
    assert moved.position == {5, 11}
  end

  test "move_down does nothing at bottom (height-1)" do
    piece = %Tetromino{position: {5, 19}}
    moved = Tetromino.move_down(piece)
    assert moved.position == {5, 19}
  end

  test "rotate cycles rotation modulo 4" do
    piece = %Tetromino{rotation: 0}
    r1 = Tetromino.rotate(piece)
    assert r1.rotation == 1
    r2 = Tetromino.rotate(r1)
    assert r2.rotation == 2
    r3 = Tetromino.rotate(r2)
    assert r3.rotation == 3
    r4 = Tetromino.rotate(r3)
    assert r4.rotation == 0
  end
end
