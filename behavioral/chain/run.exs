defmodule FileLogger do
	def init(:ok) do
		{:ok, nil}
	end

	def handle_cast({:wrn, msg}, nil) do
		IO.puts "Logging to file: #{msg}"
		{:noreply, nil}
	end

	###########################################################################

	def start_link do
		GenServer.start_link __MODULE__, :ok
	end

	def warn(pid, msg) do
		GenServer.cast(pid, {:wrn, msg})
	end
end

defmodule EmailLogger do
	def init(:ok) do
		{:ok, nil}
	end

	def handle_cast({:err, msg}, nil) do
		IO.puts "Logging to email: #{msg}"
		{:noreply, nil}
	end

	###########################################################################

	def start_link do
		GenServer.start_link __MODULE__, :ok
	end

	def error(pid, msg) do
		GenServer.cast(pid, {:err, msg})
	end
end

defmodule ConsoleLogger do
	use GenServer

	def init([file: file, email: email]) do
		    {:ok, [file: file, email: email]}
	end

	def handle_cast({:log, msg}, settings) do
		IO.puts "Logging to console: #{msg}"
		{:noreply, settings}
	end

	def handle_cast({:wrn, msg}, settings) do
		IO.puts "Logging to console: #{msg}"
		settings[:file] |> FileLogger.warn(msg)
		{:noreply, settings}
	end

	def handle_cast({:err, msg}, settings) do
		IO.puts "Logging to console: #{msg}"
		settings[:email] |> EmailLogger.error(msg)
		{:noreply, settings}
	end

	###########################################################################

	def start_link(file, email) do
		GenServer.start_link __MODULE__, [file: file, email: email]
	end

	def log(pid, msg) do
		GenServer.cast(pid, {:log, msg})
	end

	def warn(pid, msg) do
		GenServer.cast(pid, {:wrn, msg})
	end

	def error(pid, msg) do
		GenServer.cast(pid, {:err, msg})
	end
end