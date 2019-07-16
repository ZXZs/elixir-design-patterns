# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, iterator} = Iterator.new [1, 2, 3, 4, 5]
{:ok, #PID<0.107.0>}

iex(2)> if (iterator |> Iterator.next?), do: (iterator |> Iterator.next), else: (nil)
1

iex(3)> if (iterator |> Iterator.next?), do: (iterator |> Iterator.next), else: (nil)
2

iex(4)> if (iterator |> Iterator.next?), do: (iterator |> Iterator.next), else: (nil)
3

iex(5)> if (iterator |> Iterator.next?), do: (iterator |> Iterator.next), else: (nil)
4

iex(6)> if (iterator |> Iterator.next?), do: (iterator |> Iterator.next), else: (nil)
5

iex(7)> if (iterator |> Iterator.next?), do: (iterator |> Iterator.next), else: (nil)
nil
```