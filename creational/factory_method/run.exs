defmodule Object do
	def init(it) do
		(Task.start_link fn -> it.loop() end) |> elem(1)
	end
end

defmodule App do
	def fetch do
		receive do some -> some end
	end
end

################### ABSTRACT #############################

defmodule Watch do
	def show_time(it) do
		send it, {:show, :time, self()}
	end
end

defmodule WatchCreator do
	def create(it) do
		send it, {:create, self()}
	end
end

####################### CONCRETE WATCH ###################

defmodule DigitalWatch do
	def loop do
		receive do
			{:show, :time, caller} -> 
				send caller, "13:37"
				loop()
		end
	end
end

defmodule RomeWatch do
	def loop do
		receive do
			{:show, :time, caller} -> 
				send caller, "VII-XV"
				loop()
		end
	end
end

####################### CONCRETE CREATOR ###################

defmodule DigitalWatchCreator do
	def loop do
		receive do
			{:create, caller} ->
				send caller, DigitalWatch |> Object.init()
				loop()
		end
	end
end

defmodule RomeWatchCreator do
	def loop do
		receive do
			{:create, caller} ->
				send caller, RomeWatch |> Object.init()
				loop()
		end
	end
end