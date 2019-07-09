# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, mediator} = Mediator.start_link
{:ok, #PID<0.109.0>}

iex(2)> {:ok, user1} = User.start_link(mediator)
{:ok, #PID<0.111.0>}

iex(3)> {:ok, user2} = User.start_link(mediator)
{:ok, #PID<0.113.0>}

iex(4)> user1 |> User.send(["Hello, user2!", to: user2])
:ok
```