defmodule GuessingGame do
  def compare(secret_number, guess \\ nil)
  def compare(secret_number, guess) when is_integer(secret_number) and not is_integer(guess), do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when (guess + 1) == secret_number or (guess - 1) == secret_number, do: "So close"
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  def compare(secret_number, guess) when is_integer(secret_number) and is_nil(guess), do: "Make a guess"
  def compare(), do: "Make a guess"
end
