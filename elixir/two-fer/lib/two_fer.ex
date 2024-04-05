defmodule TwoFer do
  @moduledoc """
  TwoFer contains the two_fer function, which returns the correct string for the given input
  """
  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(name :: String.t()) :: String.t()
  def two_fer(name \\ "you") when is_binary(name), do: "One for #{name}, one for me."
end
