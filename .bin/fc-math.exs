#! /usr/bin/env elixir

{result, _} = System.argv()
|> Enum.join("")
|> Code.eval_string()

IO.puts(result)

