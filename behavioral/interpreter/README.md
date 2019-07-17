# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> import Interpreter
Interpreter

iex(2)> interpret :+, [5, 5]
10

iex(3)> interpret :*, [5, 5]
25

iex(4)> interpret :-, [5, 5]
0

iex(5)> interpret :/, [5, 5]
1
```