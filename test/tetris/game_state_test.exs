defmodule Tetris.GameStateTest do
  use ExUnit.Case

  alias Tetris.GameState

  test "new/0 creates initial state" do
    state = GameState.new()
    assert %Tetris.GameState{} = state
    # field should be empty grid of size 20x10
    assert length(state.field.grid) == 20

    assert Enum.all?(state.field.grid, fn row ->
             length(row) == 10 and Enum.all?(row, &is_nil/1)
           end)

    # queue has 5 tetrominoes
    assert is_list(state.queue)
    assert length(state.queue) == 5
    # score and level start at 0, game_over? false
    assert state.score == 0
    assert state.level == 0
    refute state.game_over?
  end

  test "update_level/1 updates level based on score" do
    state = %Tetris.GameState{score: 2500}
    updated = GameState.update_level(state)
    assert updated.level == 2
    # boundary cases
    assert GameState.update_level(%Tetris.GameState{score: 999}).level == 0
    assert GameState.update_level(%Tetris.GameState{score: 1000}).level == 1
  end
end
