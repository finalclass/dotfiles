defmodule CleanDbTest do
  use ExUnit.Case
  doctest CleanDb

  test "greets the world" do
    assert CleanDb.hello() == :world
  end
end
