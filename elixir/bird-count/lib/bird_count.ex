defmodule BirdCount do
  @doc """
  Returns todays bird count from the given list.
  """
  @spec today([] | [non_neg_integer()]) :: nil | non_neg_integer()
  def today([]), do: nil
  def today([today | _other_days]), do: today

  @doc """
  Increments todays bird count by one.

  If an empty list is given, it returns a new list of `[1]`, else the given list with today + 1
  """
  @spec increment_day_count([] | [non_neg_integer()]) :: [non_neg_integer()]
  def increment_day_count([]), do: [1]
  def increment_day_count([today | other_days]), do: [today + 1 | other_days]

  @doc """
  Returns true if the given list contains a day with zero, else false.
  """
  @spec has_day_without_birds?([] | [non_neg_integer()]) :: boolean()
  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _other_days]), do: true
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)

  @doc """
  Returns the total birds seen.
  """
  @spec total([] | [non_neg_integer()]) :: non_neg_integer()
  def total(list), do: total(list, 0)
  defp total([], initial), do: initial
  defp total([head | tail], initial), do: total(tail, head + initial)

  @doc """
  Returns the numbers of days there 5 or more birds seen.
  """
  @spec busy_days([] | [non_neg_integer()]) :: non_neg_integer()
  def busy_days(list), do: busy_days(list, 0)
  defp busy_days([], initial), do: initial
  defp busy_days([head | tail], initial) when head >= 5, do: busy_days(tail, initial + 1)
  defp busy_days([_head | tail], initial), do: busy_days(tail, initial)
end
