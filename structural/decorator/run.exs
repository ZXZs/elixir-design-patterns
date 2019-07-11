defmodule App do
  def normal_text(text) do
    text
  end

  def text_with_quotes(text) do
    "\"" <> normal_text(text) <> "\""
  end
end

App.normal_text     ("HELLO WORLD!") |> IO.puts
App.text_with_quotes("HELLO WORLD!") |> IO.puts