defmodule Knight.Board do
  def make_board do
    board = Map.new(1..Knight.side_len, &make_row(&1))
    Map.put(
      board,
      Knight.start_field[:x],
      Map.put(board[Knight.start_field[:x]], Knight.start_field[:y], "  1"))
  end

  def print_board(board) do
    for x <- 1..Knight.side_len do
      for y <- 1..Knight.side_len do
        board[x][y]
      end ++ ['\n']
    end
    |> IO.puts
  end

  defp make_row(x) do
    {x ,Map.new(1..Knight.side_len, &make_field(&1))}
  end

  defp make_field(x) do
    {x, " - "}
  end
end
