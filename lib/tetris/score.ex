defmodule Tetris.Score do
  @moduledoc """
  Pure function for calculating score based on lines cleared and current level.
  """

  def calculate(lines, level), do: lines * (level + 1) * 100
end
