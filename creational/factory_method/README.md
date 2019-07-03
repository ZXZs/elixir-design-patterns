```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> creator = RomeWatchCreator |> Object.init()
#PID<0.121.0>

iex(2)> creator |> WatchCreator.create()
{:create, #PID<0.119.0>}

iex(3)> watch = App.fetch()
#PID<0.123.0>

iex(4)> watch |> Watch.show_time()
{:show, :time, #PID<0.119.0>}

iex(5)> time = App.fetch()
"VII-XV"
```