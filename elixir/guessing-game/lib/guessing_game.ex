defmodule GuessingGame do
  def compare(_, guess) when guess == :no_guess, do: "Make a guess"
  def compare(secret_number, guess) when secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when guess + 1 == secret_number, do: "So close"
  def compare(secret_number, guess) when guess - 1 == secret_number, do: "So close"
  def compare(secret_number, guess) when guess > secret_number, do: "Too high"
  def compare(secret_number, guess) when guess < secret_number, do: "Too low"
  def compare(_), do: "Make a guess"
end
