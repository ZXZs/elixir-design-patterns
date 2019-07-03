defmodule ConsoleLogger do
	defp loop(file \\ nil, email \\ nil) do
		receive do
			{:settings, file, email} ->
				loop(file, email)

			{:message, message} ->
				IO.puts "Writing to console: #{message}"
				loop(file, email)

			{:warning, message} ->
				IO.puts "Writing to console: #{message}"
				send file, {:warning, message}
				loop(file, email)

			{:error, message}   ->
				IO.puts "Writing to console: #{message}"
				send email, {:error, message}
				loop(file, email)
		end
	end

	def init do
		Task.start_link fn -> loop() end
	end
end

defmodule FileLogger do
	defp loop do
		receive do
			{:warning, message} ->
				IO.puts "Writing to file: #{message}"
		end
	end

	def init do
		Task.start_link fn -> loop() end
	end
end

defmodule EmailLogger do
	defp loop do
		receive do
			{:error, message} ->
				IO.puts "Writing to email: #{message}"
		end
	end

	def init do
		Task.start_link fn -> loop() end
	end
end