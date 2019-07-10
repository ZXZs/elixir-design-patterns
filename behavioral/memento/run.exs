defmodule Save do
	use Agent

	def init(level, ms) do
		Agent.start_link (fn -> %{
			level: level,
			ms:    ms   ,
		}
		end)
	end

	def get(save) do
		Agent.get(save, fn x -> x end)
	end
end

defmodule Game do
	use Agent

	def init(level \\ nil, ms \\ nil) do
		Agent.start_link (fn -> %{
			level: level,
			ms:    ms   ,
		} end)
	end

	def set(game, level, ms) do
		game |> Agent.update(fn x ->
			x 
			|> Map.put(:level, level)
			|> Map.put(:ms   , ms   )
		end)
	end

	def get(game) do
		Agent.get(game, fn x -> x end)
	end

	def load(game, save) do
		level = (save |> Save.get())[:level]
		ms    = (save |> Save.get())[:ms   ]

		game |> set(level, ms)
	end

	def save(game) do
		level = get(game)[:level]
		ms    = get(game)[:ms   ]
	
		{ :ok, save } = Save.init(level, ms); save
	end
end

defmodule App.File do
	use Agent

	def init(save \\ nil) do
		Agent.start_link fn -> %{ save: save } end
	end

	def get(file) do
		file |> Agent.get(fn x -> x end)
	end

	def set(file, save) do
		file  	|> Agent.update(fn x ->
			x |> Map.put(:save, save)
		end)
	end
end