# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, chat} = TextChat.init(nil, [])
{:ok, #PID<0.118.0>}

iex(2)> {:ok, admin} = Admin.init(chat)
{:ok, #PID<0.120.0>}

iex(3)> {:ok, u1} = User.init(chat)
{:ok, #PID<0.122.0>}

iex(4)> {:ok, u2} = User.init(chat)
{:ok, #PID<0.124.0>}

iex(5)> send chat, {:set, admin}
{:set, #PID<0.120.0>}

iex(6)> send chat, {:add, u1}
{:add, #PID<0.122.0>}

iex(7)> send chat, {:add, u2}
{:add, #PID<0.124.0>}

iex(8)> send u1, {:send, "Hello, i am user!"}
{:send, "Hello, i am user!"}

iex(9)> send admin, {:send, "ADMIN is here!!!"}
{:send, "ADMIN is here!!!"}
```