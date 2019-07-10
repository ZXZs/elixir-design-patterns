```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, game} = Game.init()
{:ok, #PID<0.111.0>}

iex(2)> game |> Game.set("LEVEL 1", 30_000)
:ok

iex(3)> game |> Game.get()
%{level: "LEVEL 1", ms: 30000}

iex(4)> {:ok, file} = App.File.init()
{:ok, #PID<0.115.0>}

iex(5)> {:ok, save} = Save.init(Game.get(game)[:level], Game.get(game)[:ms])
{:ok, #PID<0.117.0>}

iex(6)> file |> App.File.set(save)
:ok

iex(7)> game |> Game.set("LEVEL 2", 55_000)
:ok

iex(8)> game |> Game.get()
%{level: "LEVEL 2", ms: 55000}

iex(9)> game |> Game.load(save)
:ok

iex(10)> game |> Game.get()
%{level: "LEVEL 1", ms: 30000}
```