defmodule User do
	use GenServer

	def init(mediator) do
		{:ok, mediator}
	end

	def handle_cast({:send, [message, to: to]}, mediator) do
		mediator |> Mediator.send([message, from: self(), to: to])
		{:noreply, mediator}
	end

	def handle_cast({:receive, [message, from: from]}, mediator) do
		IO.inspect [message, from: from]
		{:noreply, mediator}
	end

	###########################################################################

	def start_link(mediator) do
		GenServer.start_link(__MODULE__, :ok, [mediator])
	end

	def send(user, [message, to: to]) do
		GenServer.cast(user, {:send, [message, to: to]})
	end

	def receive(user, [message, from: from]) do
		GenServer.cast(user, {:receive, [message, from: from]})
	end
end

defmodule Mediator do
	use GenServer

	def init(:ok) do
		{:ok, true}
	end

	def handle_cast({:send, [message, from: from, to: to]}) do
		to |> User.receive([message, from: from])
		:noreply
	end

	###########################################################################

	def start_link do
		GenServer.start_link(__MODULE__, :ok, [])
	end

	def send(mediator, [message, from: from, to: to]) do
		GenServer.cast mediator, {:send, [message, from: from, to: to]}
	end
end