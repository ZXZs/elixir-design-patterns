defmodule Interface do
  @callback test() :: atom()
end

defmodule First do
  @behaviour Interface

  def test(), do: :"I am FIRST!!!"
end

defmodule Second do
  @behaviour Interface

  defdelegate test(), to: First
end

First.test  |> IO.inspect # :"I AM FIRST!!!"
Second.test |> IO.inspect # :"I AM FIRST!!!"