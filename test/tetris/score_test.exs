defmodule Tetris.ScoreTest do
  use ExUnit.Case

  alias Tetris.Score

  test "calculate/2 returns correct points" do
    assert Score.calculate(1, 0) == 100
    assert Score.calculate(2, 1) == 400
    assert Score.calculate(4, 3) == 1600
  end
end
