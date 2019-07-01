defmodule PrinterBehaviour do
  @callback print(text :: String.t()) :: none()
end

defmodule Printer do
  @behaviour PrinterBehaviour

  defstruct [:text]

  def print(self), do: IO.puts self.text
end

defmodule QuotesDecorator do
  @behaviour PrinterBehaviour

  defstruct [:printer]

  def print(self), do: IO.puts ("\"" <> self.printer.text <> "\"")
end

defmodule App do
  def main do
    printer = % Printer { text: "Hello" }
    decorated_printer = % QuotesDecorator { printer: printer }

    printer |> Printer.print
    decorated_printer |> QuotesDecorator.print
  end
end

App.main
  # Hello
  # "Hello"