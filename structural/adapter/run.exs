defmodule VectorGraphics do
	@callback line()   :: no_return
	@callback square() :: no_return
end

defmodule RasterGraphics do
	def raster_line(),   do: 'line'
	def raster_square(), do: 'square'
end

defmodule Adapter do
	@behaviour VectorGraphics
	import RasterGraphics

	def line(),   do: raster_line()
	def square(), do: raster_square()
end

defmodule App do
	def main() do
		{Adapter.line(), Adapter.square()}
	end
end

App.main() |> IO.inspect()