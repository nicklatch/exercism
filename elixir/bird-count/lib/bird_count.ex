defmodule BirdCount do
  @busy_day 5

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
  def has_day_without_birds?([_today | other_days]), do: has_day_without_birds?(other_days)

  @doc """
  Returns the total birds seen.
  """
  @spec total([] | [non_neg_integer()]) :: non_neg_integer()
  def total(bird_count_list), do: total(bird_count_list, 0)
  defp total([], birds), do: birds
  defp total([today | other_days], birds), do: total(other_days, today + birds)

  @doc """
  Returns the numbers of days there 5 or more birds seen.
  """
  @spec busy_days([] | [non_neg_integer()]) :: non_neg_integer()
  def busy_days(bird_count_list), do: busy_days(bird_count_list, 0)
  defp busy_days([], busy_total), do: busy_total

  defp busy_days([today | other_days], busy_total) when today >= @busy_day,
    do: busy_days(other_days, busy_total + 1)

  defp busy_days([_today | other_days], busy_total), do: busy_days(other_days, busy_total)
end
