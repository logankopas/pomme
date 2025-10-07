defmodule PommeTest do
  use ExUnit.Case
  doctest Pomme

  test "greets the world" do
    assert Pomme.hello() == :world
  end
end
