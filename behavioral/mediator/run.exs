defmodule Admin do
	defp loop(chat) do
		receive do
			{:send, message} ->
				send chat, {:msg, [user: self(), message: message]}
				loop(chat)
			{:get, message} ->
				"Admin got message \"" <> message <> "\""
				loop(chat)
		end
	end

	def init(chat) do
		Task.start_link fn -> loop(chat) end
	end
end

defmodule User do
	defp loop(chat) do
		receive do
			{:send, message} ->
				send chat, {:msg, [user: self(), message: message]}
				loop(chat)

			{:get, message} ->
				"User got message \"" <> message <> "\""
				loop(chat)
		end
	end

	def init(chat) do
		Task.start_link fn -> loop(chat) end
	end
end

defmodule TextChat do
	defp loop(admin, users) do
		receive do
			{:set, admin} ->
				loop(admin, users)

			{:add, user} ->
				loop(admin, users ++ [user])

			{:send, [user: user, message: message]} ->
				users |> Enum.each(fn x -> send x, {:get, message} end)
				send admin, {:get, message}
		end
	end

	def init(admin, users) do
		Task.start_link fn -> loop(admin, users) end
	end
end

defmodule App do
	def main do
		{:ok, chat} = TextChat.init(nil, [])

		{:ok, admin} = Admin.init(chat)

		{:ok, u1} = User.init(chat)
		{:ok, u2} = User.init(chat)

		send chat, {:set, admin}

		send chat, {:add, u1}
		send chat, {:add, u2}

		send u1, {:send, "Hello, i am user"}

		send admin, {:send, "ADMIN is here!!!"}
	end
end

App.main