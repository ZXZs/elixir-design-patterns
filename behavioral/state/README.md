# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

# initializing

iex(1)> text_editor = TextEditor.init()
#PID<0.113.0>

iex(2)> normal_case = NormalCaseState.init()
#PID<0.115.0>

iex(3)> lower_case = LowerCaseState.init()
#PID<0.117.0>

iex(4)> upper_case = UpperCaseState.init()
#PID<0.119.0>

# let's try it with normal case

iex(5)> send text_editor, {:set, normal_case}
{:set, #PID<0.115.0>}

iex(6)> send text_editor, {:use, "HELLO WORLD", self()}
{:use, "HELLO WORLD", #PID<0.111.0>}

iex(7)> x = receive do some -> some end
"Hello world"

# lower case?

iex(8)> send text_editor, {:set, lower_case}
{:set, #PID<0.117.0>}

iex(9)> send text_editor, {:use, "HELLO WORLD", self()}
{:use, "HELLO WORLD", #PID<0.111.0>}

iex(10)> x = receive do some -> some end
"hello world"

# upper case?

iex(11)> send text_editor, {:set, upper_case}
{:set, #PID<0.119.0>}

iex(12)> send text_editor, {:use, "hello world", self()}
{:use, "hello world", #PID<0.111.0>}

iex(13)> x = receive do some -> some end
"HELLO WORLD"
```