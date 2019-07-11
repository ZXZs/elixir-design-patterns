```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, dev} = PanelDeveloper.new("Kirpich Corporation")
{:ok, #PID<0.117.0>}

iex(2)> house2 = dev |> PanelDeveloper.create()
Panel house built
#PID<0.119.0>

iex(3)> {:ok, dev} = WoodDeveloper.new("NoName Corporation")
{:ok, #PID<0.121.0>}

iex(4)> house = dev |> WoodDeveloper.create()
Wood house built
#PID<0.123.0>

iex(5)> IO.inspect [dev: dev, houses: {house, house2}]
[dev: #PID<0.121.0>, houses: {#PID<0.123.0>, #PID<0.119.0>}]
[dev: #PID<0.121.0>, houses: {#PID<0.123.0>, #PID<0.119.0>}]
```