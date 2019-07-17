defmodule Type do
	defstruct [:details]

	def new(details), do: % __MODULE__ { details: details }
end

defmodule Make do
	defstruct [:details]

	def new(details), do: % __MODULE__ { details: details }
end

defmodule Car do
	def init({type, make}), do:
		{:ok, {type, make}}

	def new({type, make}), do:
		GenServer.start_link __MODULE__, {type, make}



	def handle_call(:make_details, _from, {type, make}), do:
		{:reply, make.details, {type, make}}

	def handle_call(:type_details, _from, {type, make}), do:
		{:reply, type.details, {type, make}}



	def make_details(pid), do:
		GenServer.call(pid, :make_details)

	def type_details(pid), do:
		GenServer.call(pid, :type_details)
end