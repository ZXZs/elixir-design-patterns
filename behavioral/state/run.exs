defmodule NormalCaseState do
	defp loop() do 
		receive do
		{:use, text, pid} ->
			send pid, (text |> String.capitalize)
			loop()
		end
	end

	def init() do
		(Task.start_link fn -> loop() end) |> elem(1)
	end
end

defmodule LowerCaseState do
	defp loop() do 
		receive do
		{:use, text, pid} ->
			send pid, (text |> String.downcase)
			loop()
		end
	end

	def init() do
		(Task.start_link fn -> loop() end) |> elem(1)
	end
end

defmodule UpperCaseState do
	defp loop() do receive do
		{:use, text, pid} ->
			send pid, (text |> String.upcase)
			loop()
		end
	end

	def init() do
		(Task.start_link fn -> loop() end) |> elem(1)
	end
end

defmodule TextEditor do
	defp loop(state \\ nil) do receive do
		{:set, state} ->
			loop(state)

		{:use, text, pid} ->
			send state, {:use, text, self()}
			text = (receive do some -> some end)
			send pid, text
			loop(state)
		end
	end

	def init() do
		(Task.start_link fn -> loop() end) |> elem(1)
	end
end