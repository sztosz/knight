defmodule Knight do
  use Application

 def start(_type, _args) do
   Knight.Board.make_board
   |> Knight.Solver.solve()
 end

 def side_len do
   Application.get_env(:knight, :side_len)
 end

 def start_field do
   Application.get_env(:knight, :start_field)
 end
end
