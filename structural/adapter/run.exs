defmodule VectorGraphics do
	@callback line()   :: no_return
	@callback square() :: no_return
end

defmodule RasterGraphics do
	def raster_line(),   do: 'line'
	def raster_square(), do: 'square'
end

defmodule Adapter do
	defdelegate line, 
		to: RasterGraphics, 
		as: :raster_line

	defdelegate square,
		to: RasterGraphics,
		as: :raster_square
end

defmodule App do
	def main() do
		{Adapter.line(), Adapter.square()}
	end
end

App.main() |> IO.inspect()