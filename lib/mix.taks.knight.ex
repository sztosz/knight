defmodule Mix.Tasks.Knight do
  use Mix.Task

  @shortdoc "show Knight move on board"

  def run(_args) do
    spawn Knight.start(nil, nil)
  end
end
