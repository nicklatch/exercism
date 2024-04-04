defmodule BirdCount do
  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | tail]) when head != 0, do: has_day_without_birds?(tail)
  def has_day_without_birds?([head | _tail]) when head == 0, do: true

  def total(list), do: total(list, 0)
  def total([], initial), do: initial
  def total([head | tail], initial), do: total(tail, head + initial)

  def busy_days(list), do: busy_days(list, 0)
  def busy_days([], initial), do: initial
  def busy_days([day], initial) when day >= 5, do: initial + 1
  def busy_days([head | tail], initial) when head >= 5, do: busy_days(tail, initial + 1)
  def busy_days([_head | tail], initial), do: busy_days(tail, initial)
end
