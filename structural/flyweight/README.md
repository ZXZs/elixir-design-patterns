# Usage

```
$ iex run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, factory} = UserFactory.new
{:ok, #PID<0.107.0>}

iex(2)> a_user = factory |> UserFactory.it([login: "A", email: "A", password: "A"])
#PID<0.109.0>

iex(3)> b_user = factory |> UserFactory.it([login: "B", email: "B", password: "B"])
#PID<0.111.0>

iex(4)> again_a_user = factory |> UserFactory.it([login: "A", email: "A", password: "A"])
#PID<0.109.0>

iex(5)> again_b_user = factory |> UserFactory.it([login: "B", email: "B", password: "B"])
#PID<0.111.0>
```