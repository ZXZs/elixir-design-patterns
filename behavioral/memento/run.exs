defmodule Save do
	defstruct [:level, :ms]
end

defmodule Game do
	defp loop(level \\ nil, ms \\ nil) do
		receive do
			{:set, level, ms} ->
				loop(level, ms)

			{:load, save} ->
				loop(save.level, save.ms)

			{:save, caller} ->
				send caller, % Save { level: level, ms: ms}
				loop(level, ms)
		end
	end

	def init do
		Task.start_link fn -> loop() end
	end
end

defmodule File_ do
	defp loop(save \\ nil) do
		receive do
			{:get, caller} ->
				send caller, save
				loop(save)

			{:set, save} ->
				loop(save)
		end
	end

	def init do
		Task.start_link fn -> loop() end
	end
end