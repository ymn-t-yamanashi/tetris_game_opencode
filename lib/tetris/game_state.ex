defmodule Tetris.GameState do
  @moduledoc """
  Holds the overall game state.
  """
  defstruct field: %Tetris.GameField{},
            current: nil,
            queue: [],
            score: 0,
            level: 0,
            game_over?: false

  @doc """
  Create a new initial state with an empty field and five random tetrominoes in the queue.
  """
  def new() do
    field = Tetris.GameField.new()
    queue = Enum.map(1..5, fn _ -> Tetris.Tetromino.random() end)

    %__MODULE__{
      field: field,
      current: nil,
      queue: queue,
      score: 0,
      level: 0,
      game_over?: false
    }
  end

  @doc """
  Update the level based on the current score.
  """
  def update_level(state) do
    new_level = div(state.score, 1000)
    %{state | level: new_level}
  end
end
