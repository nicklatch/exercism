defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, a2}, {b1, b2}), do: {a1 * b2 + b1 * a2, a2 * b2} |> reduce()

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, a2}, {b1, b2}), do: {a1 * b2 - b1 * a2, a2 * b2} |> reduce()

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, a2}, {b1, b2}), do: {a1 * b1, a2 * b2} |> reduce()

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, a2}, {b1, b2}), do: {a1 * b2, a2 * b1} |> reduce()

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, a2}), do: {Kernel.abs(a1), Kernel.abs(a2)} |> reduce()

  defp pow_int(number, exp) when is_integer(number) and is_integer(exp) and exp >= 0 do
    :math.pow(number, exp) |> trunc()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a1, a2}, n) when n > 0, do: {pow_int(a1, n), pow_int(a2, n)} |> reduce()
  def pow_rational({a1, a2}, n), do: {pow_int(a2, -1 * n), pow_int(a1, -1 * n)} |> reduce()

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a1, a2}), do: :math.pow(x, a1 / a2)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({0, _}), do: {0, 1}
  def reduce({x, x}), do: {1, 1}
  def reduce({a1, a2}) when a1 > 0 and a2 < 0, do: {-a1, -a2} |> reduce()
  def reduce({a1, a2}) when a1 < 0 and a2 < 0, do: {-a1, -a2} |> reduce()
  def reduce({a1, a2}), do: do_reduce({a1, a2}, 2, min(Kernel.abs(a1), Kernel.abs(a2)))
  def reduce(a), do: a

  # TODO: Clean this up a bit
  defp do_reduce({a1, a2}, candidate, min) when candidate <= min do
    if rem(a1, candidate) == 0 and rem(a2, candidate) == 0 do
      a1_new = div(a1, candidate)
      a2_new = div(a2, candidate)
      do_reduce({a1_new, a2_new}, candidate, min(Kernel.abs(a1_new), Kernel.abs(a2_new)))
    else
      do_reduce({a1, a2}, candidate + 1, min)
    end
  end

  defp do_reduce({a1, a2}, _candidate, _min), do: {a1, a2}
end

