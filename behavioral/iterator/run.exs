defmodule Iterator do
	def init({aggregate, index}), do: 
		{:ok, {aggregate, index}}

	def new(aggregate, index \\ -1), do:
		GenServer.start_link __MODULE__, {aggregate, index}



	def handle_call(:next?, _from, {aggregate, index}), do:
		if not (aggregate |> Enum.at(index + 1) |> is_nil), do: 
			{:reply, true, {aggregate, index}}, 
		else: 
			{:reply, false, {aggregate, index}}

	def next?(pid), do:
		GenServer.call(pid, :next?)



	def handle_call(:next, _from, {aggregate, index}) do
		{:reply, Enum.at(aggregate, index + 1), {aggregate, index + 1}}
	end

	def next(pid) do
		GenServer.call(pid, :next)
	end
end