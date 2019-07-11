defmodule House do
	defmacro __using__(_opts) do
		quote do
			def init(:ok) do
				{:ok, true}
			end

			defoverridable init: 1

			def build do
				GenServer.start_link __MODULE__, :ok
			end
		end
	end
end

defmodule PanelHouse do
	use House

	def init(:ok) do
		IO.puts "Panel house built"
		super(:ok)
	end
end

defmodule WoodHouse do
	use House

	def init(:ok) do
		IO.puts "Wood house built"
		super(:ok)
	end
end

###############################################################################

defmodule Developer do
	defmacro __using__(_opts) do
		quote do
			def init(name) do
				{:ok, name}
			end

			def new(name) do
				GenServer.start_link __MODULE__, name
			end

			def create(pid) do
				raise "#{__MODULE__}.create is undefined"
			end

			defoverridable create: 1
		end
	end
end

defmodule PanelDeveloper do
	use Developer

	def handle_call(:create, _from, name) do
		{:ok, house} = PanelHouse.build()
		{:reply, house, name}
	end

	def create(pid) do
		GenServer.call(pid, :create)
	end
end

defmodule WoodDeveloper do
	use Developer

	def handle_call(:create, _from, name) do
		{:ok, house} = WoodHouse.build()
		{:reply, house, name}
	end

	def create(pid) do
		GenServer.call(pid, :create)
	end
end