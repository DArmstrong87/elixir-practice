defmodule ElixirPracticeTest do
  use ExUnit.Case
  doctest ElixirPractice

  test "greets the world" do
    assert ElixirPractice.hello() == :world
  end
end
