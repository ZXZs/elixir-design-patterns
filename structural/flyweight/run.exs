defmodule User do # flyweight
	def init([login: login, email: email, password: password]), do:
		{:ok, [login: login, email: email, password: password]}

	def new(settings), do:
		GenServer.start_link __MODULE__, settings



	def handle_call(:get, _from, settings), do:
		{:reply, settings, settings}

	def get(pid), do:
		GenServer.call(pid, :get)
end

defmodule UserFactory do
	def init(pool), do:
		{:ok, pool}

	def new(pool \\ []), do:
		GenServer.start_link __MODULE__, pool



	def handle_call(settings, _from, pool) do
		return = pool |> Enum.find(fn user -> user |> User.get == settings end)

		if is_nil(return) do
			{:ok, this} = User.new(settings)
			{:reply, this, pool ++ [this]}
		else
			{:reply, return, pool}
		end
	end

	def it(pid, settings), do:
		GenServer.call(pid, settings)
end