# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, game} = Game.init()
{:ok, #PID<0.111.0>}

iex(2)> send game, {:set, :"LVL 1", 30_000}
{:set, :"LVL 1", 30000}

iex(3)> {:ok, file} = File_.init()
{:ok, #PID<0.114.0>}

iex(4)> send game, {:save, self()}
{:save, #PID<0.109.0>}

iex(5)> save0 = receive do some -> some end
%Save{level: :"LVL 1", ms: 30000}

iex(6)> send file, {:set, save0}
{:set, %Save{level: :"LVL 1", ms: 30000}}

iex(7)> send game, {:set, :"LVL 2", 55_000}
{:set, :"LVL 2", 55000}

iex(8)> send file, {:get, self()}
{:get, #PID<0.109.0>}

iex(9)> save1 = receive do some -> some end
%Save{level: :"LVL 1", ms: 30000}

iex(10)> send game, {:load, save1}
{:load, %Save{level: :"LVL 1", ms: 30000}}
```