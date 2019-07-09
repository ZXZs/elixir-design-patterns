defmodule NormalCaseState do
  def use(text) do
    text |> String.capitalize
  end
end

defmodule UpperCaseState do
  def use(text) do
    text |> String.upcase
  end
end

defmodule LowerCaseState do
  def use(text) do
    text |> String.downcase
  end
end

###############################################################################

defmodule TextEditor do
  use GenServer

  def init(:ok) do
    {:ok, nil}
  end

  def handle_cast({:state, new_state}, _old_state) do
    {:noreply, new_state}
  end

  def handle_call({:text, text}, _from, state) do
    {:reply, state.use(text), state}
  end

  #############################################################################

  def start_link do
    GenServer.start_link(__MODULE__, :ok)
  end

  def set(server, state) do
    GenServer.cast(server, {:state, state})
  end

  def edit(server, text) do
    GenServer.call(server, {:text, text})
  end
end