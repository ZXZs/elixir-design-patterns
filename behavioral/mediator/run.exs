defmodule User do
	defp loop(mediator) do
		receive do
			{:send, [message: message, to: to]} ->
				send mediator , {:send, [
					message: message,
					from: self(),
					to: to
				]}
				loop(mediator)

			{:receive, [message: message, from: from]} ->
				IO.inspect {"Got message:", message, "from:", from}
				loop(mediator)
		end
	end

	def init(mediator) do
		Task.start_link(fn -> loop(mediator) end)
	end
end

defmodule Mediator do
	defp loop() do
		receive do
			{:send, [message: message, from: from, to: to]} ->
				send to , {:receive, [message: message, from: from]}
				loop()
		end
	end

	def init() do
		Task.start_link(fn -> loop() end)
	end
end