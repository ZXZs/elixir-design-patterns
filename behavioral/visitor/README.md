# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, engine} = Engine.new
{:ok, #PID<0.121.0>}

iex(2)> {:ok, body} = Body.new
{:ok, #PID<0.123.0>}

iex(3)> {:ok, gopnik} = Gopnik.new
{:ok, #PID<0.125.0>}

iex(4)> {:ok, mechanic} = Mechanic.new
{:ok, #PID<0.127.0>}

iex(5)> engine |> Engine.accept(gopnik)
Starting engine...
:ok

iex(6)> engine |> Engine.accept(mechanic)
Checking engine...
:ok

iex(7)> body |> Body.accept(mechanic)
Clearing body...
:ok

iex(8)> body |> Body.accept(gopnik)
Kicking body...
:ok
```