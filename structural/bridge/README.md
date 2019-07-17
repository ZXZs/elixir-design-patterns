# Usage

```
$ iex -pr run.exs
Interactive Elixir (1.9.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> skoda_sedan = {Type.new(:Sedan), Make.new(:Skoda)}
{%Type{details: :Sedan}, %Make{details: :Skoda}}

iex(2)> kia_hatchback = {Type.new(:Hatchback), Make.new(:Kia)}
{%Type{details: :Hatchback}, %Make{details: :Kia}}

iex(3)> {:ok, skoda_sedan} = Car.new(skoda_sedan)
{:ok, #PID<0.113.0>}

iex(4)> {:ok, kia_hatchback} = Car.new(kia_hatchback)
{:ok, #PID<0.115.0>}

iex(5)> skoda_sedan |> Car.type_details
:Sedan

iex(6)> kia_hatchback |> Car.make_details
:Kia
```