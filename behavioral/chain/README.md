# Usage

```
$ iex -pr _run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, file} = FileLogger.start_link()
{:ok, #PID<0.111.0>}

iex(2)> {:ok, email} = EmailLogger.start_link()
{:ok, #PID<0.113.0>}

iex(3)> {:ok, console} = ConsoleLogger.start_link(file, email)
{:ok, #PID<0.115.0>}

iex(4)> console |> ConsoleLogger.log("Just a message")
Logging to console: Just a message
:ok

iex(5)> console |> ConsoleLogger.warn("Oh shit, something is wrong")
Logging to console: Oh shit, something is wrong
:ok
Logging to file: Oh shit, something is wrong

iex(6)> console |> ConsoleLogger.error("HERE WE GO AGAIN! SHUTTING Down.......")
Logging to console: HERE WE GO AGAIN! SHUTTING Down.......
:ok
Logging to email: HERE WE GO AGAIN! SHUTTING Down.......
```