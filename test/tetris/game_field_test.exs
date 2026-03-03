defmodule Tetris.GameFieldTest do
  use ExUnit.Case

  alias Tetris.GameField

  test "new/0 creates empty grid" do
    field = GameField.new()
    assert length(field.grid) == 20
    assert Enum.all?(field.grid, fn row -> length(row) == 10 and Enum.all?(row, &is_nil/1) end)
  end
end
