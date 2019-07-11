defmodule Copyable do
  defmacro __using__(_opts) do
    quote do
      def copy(_pid) do
        raise "#{__MODULE__}.copy is undefined"
      end

      defoverridable copy: 1
    end
  end
end

defmodule Human do
  use Copyable

  def init([name: name, age: age]) do
    {:ok,  [name: name, age: age]}
  end

  def new(name, age) do
    (GenServer.start_link __MODULE__, [name: name, age: age])
    |> elem(1)
  end

  def handle_call(:get, _from, fields) do
    {:reply, fields, fields}
  end

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def handle_call(:copy, _from, fields) do
    name = fields[:name]
    age  = fields[:age ]
    {:reply, new(name, age), fields}
  end

  def copy(pid) do
    GenServer.call(pid, :copy)
  end
end