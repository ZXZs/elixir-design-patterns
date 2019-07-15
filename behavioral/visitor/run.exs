defmodule Visitor do
	defmacro __using__(_opts) do
		quote do
			def init(nil) do
				{:ok, nil}
			end

			def new do
				GenServer.start_link __MODULE__, nil
			end

			def visit(pid, type, element) do
				GenServer.cast(pid, {:visit, type, element})
			end
		end
	end
end

defmodule Gopnik do
	use Visitor

	def handle_cast({:visit, :engine, _engine}, nil) do
		IO.puts "Starting engine..."
		{:noreply, nil}
	end

	def handle_cast({:visit, :body, _body}, nil) do
		IO.puts "Kicking body..."
		{:noreply, nil}
	end
end

defmodule Mechanic do
	use Visitor

	def handle_cast({:visit, :engine, _engine}, nil) do
		IO.puts "Checking engine..."
		{:noreply, nil}
	end

	def handle_cast({:visit, :body, _body}, nil) do
		IO.puts "Clearing body..."
		{:noreply, nil}
	end
end

defmodule Element do
	defmacro __using__(_opts) do
		quote do
			def init(nil) do
				{:ok, nil}
			end

			def new do
				GenServer.start_link __MODULE__, nil
			end

			defmodule AbstractVisitor do 
				use Visitor
			end
		end
	end
end

defmodule Engine do
	use Element

	def accept(pid, visitor) do
		visitor |> AbstractVisitor.visit(:engine, pid)
	end
end

defmodule Body do
	use Element

	def accept(pid, visitor) do
		visitor |> AbstractVisitor.visit(:body, pid)
	end
end