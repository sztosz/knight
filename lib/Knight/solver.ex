defmodule Knight.Solver do
  use GenServer

  @moves [
    %{x: 2, y: 1}, %{x: 1, y: 2},
    %{x: -1, y: 2}, %{x: -2, y: 1},
    %{x: 1, y: -2}, %{x: 2, y: -1},
    %{x: -2, y: -1}, %{x: -1, y: -2},
  ]

  def solve(board, field \\ Knight.start_field, move_count \\ 1) do
    case field_count == move_count do
      true ->
        Knight.Board.print_board(board)
        exit(:shutdown)
      _ ->
        valid_moves = Enum.reduce(@moves, [], &valid_move(&1, &2, board, field))
        unless Enum.count(valid_moves) == 0 do
          Enum.each(valid_moves, &update_board_and_solve(&1, board, move_count + 1))
        end
    end
  end

  def valid_move(move, acc, board, field) do
    x = move[:x] + field[:x]
    y = move[:y] + field[:y]
    case in_board(x, y, board) do
      true  ->
        acc ++ [%{x: x, y: y}]
      _ ->
        acc
    end
  end

  def update_board_and_solve(move, board, move_count) do
    board = Map.put(board, move[:x], Map.put(board[move[:x]], move[:y], Integer.to_string(move_count) |> String.rjust(3)))
    solve(board, move, move_count)
  end

  def in_board(x, y, board) do
    (x > 0) and (x <= Knight.side_len) and (y > 0) and (y <= Knight.side_len) and (board[x][y] == " - ")
  end

  defp field_count do
    Knight.side_len * Knight.side_len
  end
end
