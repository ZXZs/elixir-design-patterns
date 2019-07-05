# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

# initializing

iex(1)> {:ok, mediator} = Mediator.init()
{:ok, #PID<0.109.0>}

iex(2)> {:ok, user1} = User.init(mediator)
{:ok, #PID<0.111.0>}

iex(3)> {:ok, user2} = User.init(mediator)
{:ok, #PID<0.113.0>}

# let's try to send message

iex(4)> send user1, {:send, [message: "Hello, drugan!", to: user2]}
{:send, [message: "Hello, drugan!", to: #PID<0.113.0>]}
{"Got message:", "Hello, drugan!", "from:", #PID<0.111.0>}

```