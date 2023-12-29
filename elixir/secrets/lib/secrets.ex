defmodule Secrets do
  @doc """
  Returns a function that adds the given `secret` to its input.
  """
  @spec secret_add(number()) :: (number() -> number())
  def secret_add(secret) do
    fn x -> x + secret end
  end

  @doc """
  Returns a function that subtracts the given `secret` from its input.
  """
  @spec secret_subtract(number()) :: (number() -> number())
  def secret_subtract(secret) do
    fn x -> x - secret end
  end
  @doc """
  Returns a function that multiplies its input by the given `secret`.
  """
  @spec secret_multiply(number()) :: (number() -> number())
  def secret_multiply(secret) do
    fn x -> x * secret end
  end

  @doc """
  Returns a function that divides its input by the given `secret` and truncates the result.
  """
  @spec secret_divide(number()) :: (number() -> integer())
  def secret_divide(secret) do
    fn x -> trunc(x / secret) end
  end

  @doc """
  Returns a function that performs a bitwise AND operation on its input and the given `secret`.
  """
  @spec secret_and(integer()) :: (integer() -> integer())
  def secret_and(secret) do
    fn x -> Bitwise.band(x, secret) end
  end

  @doc """
  Returns a function that performs a bitwise XOR operation on its input and the given `secret`.
  """
  @spec secret_xor(integer()) :: (integer() -> integer())
  def secret_xor(secret) do
    fn x -> Bitwise.bxor(x, secret) end
  end

  @doc """
  Returns a function that applies `secret_function2` to the result of applying `secret_function1` to its input.
  """
  @spec secret_combine(any(), any()) :: (any() -> any())
  def secret_combine(secret_function1, secret_function2) do
    fn x -> secret_function2.(secret_function1.(x)) end
  end
end
