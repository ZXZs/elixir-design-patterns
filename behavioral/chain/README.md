# Usage

```Elixir
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> {:ok, console} = ConsoleLogger.init()
{:ok, #PID<0.111.0>}

iex(2)> {:ok, file} = FileLogger.init()
{:ok, #PID<0.113.0>}

iex(3)> {:ok, email} = EmailLogger.init()
{:ok, #PID<0.115.0>}

iex(4)> send console, {:settings, file, email}
{:settings, #PID<0.113.0>, #PID<0.115.0>}

iex(5)> send console, {:message, "just a message"}
Writing to console: just a message
{:message, "just a message"}

iex(6)> send console, {:warning, "oh shit, it's warning"}
Writing to console: oh shit, it's warning
{:warning, "oh shit, it's warning"}
Writing to file: oh shit, it's warning

iex(7)> send console, {:error, "GOD DAMN SHIT, ERROR!!!!!!!!!!!"}
Writing to console: GOD DAMN SHIT, ERROR!!!!!!!!!!!
{:error, "GOD DAMN SHIT, ERROR!!!!!!!!!!!"}
Writing to email: GOD DAMN SHIT, ERROR!!!!!!!!!!!
```