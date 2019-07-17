defmodule Interpreter do
	def interpret(operator, args) do
		case operator do
			:+ -> 
				args |> 
					Enum.sum

			:* ->
				args |> 
					Enum.reduce(fn x, acc -> acc * x end)

			:- ->
				args |> 
					Enum.reduce(fn x, acc -> acc - x end)

			:/ ->
				args |> 
					Enum.reduce(fn x, acc -> acc / x end) |> 
						round
		end
	end
end