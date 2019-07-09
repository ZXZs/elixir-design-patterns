# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, editor} = TextEditor.start_link
{:ok, #PID<0.113.0>}

iex(2)> editor |> TextEditor.set(UpperCaseState)
:ok

iex(3)> editor |> TextEditor.edit("hello world!")
"HELLO WORLD!"
```