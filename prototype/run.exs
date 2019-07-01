defmodule Copyable do
  @callback copy(self :: Any) :: Any
end

defmodule Human do
  @behaviour Copyable

  defstruct [:age, :name]

  def copy(self), do: % Human { 
    age: self.age, name: self.name 
  }
end

defmodule App do
  def main do
    original = % Human {
      age: 18,
      name: "Vasya"
    }

    copy = original |> Human.copy

    {original, copy}
  end
end

App.main |> IO.inspect(width: 0)