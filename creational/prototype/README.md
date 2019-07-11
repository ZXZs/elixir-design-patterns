# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> original = Human.new("Vasya", 22)
#PID<0.109.0>

iex(2)> copy = original |> Human.copy()
#PID<0.111.0>

iex(3)> original |> Human.get()
[name: "Vasya", age: 22]

iex(4)> copy |> Human.get()
[name: "Vasya", age: 22]

```