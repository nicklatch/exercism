defmodule FreelancerRates do
  @moduledoc """
  A module for calculating freelancer rates.

  "Calculates estimated work days within a budget, daily and monthly freelancer rates based on hourly rate and discount."

  ## Constants

  - `@daily_hours`: The number of hours a freelancer works in a day.
  - `@billable_days`: The number of days a freelancer works in a month.

  ## Functions

  - `daily_rate/1`: Calculates the daily rate for a freelancer.
  - `apply_discount/2`: Applies a discount to a given amount.
  - `monthly_rate/2`: Calculates the monthly rate for a freelancer.
  - `days_in_budget/3`: Calculates the number of days a freelancer can work given a budget.

  """

  @daily_hours 8.0
  @billable_days 22

  @doc """
  Calculates the daily rate for a freelancer given their hourly rate.

  ## Parameters

  - `hourly_rate`: The hourly rate of the freelancer.

  ## Returns

  - The daily rate as a float.
  """
  @spec daily_rate(number()) :: float()
  def daily_rate(hourly_rate) do
    hourly_rate * @daily_hours
  end

  @doc """
  Applies a discount to a given amount.

  ## Parameters

  - `before_discount`: The amount before the discount is applied.
  - `discount`: The discount rate as a percentage.

  ## Returns

  - The amount after the discount has been applied as a float.
  """
  @spec apply_discount(number(), number()) :: float()
  def apply_discount(before_discount, discount) do
    before_discount * (1.0 - discount / 100)
  end

  @doc """
  Calculates the monthly rate for a freelancer given their hourly rate and a discount.

  ## Parameters

  - `hourly_rate`: The hourly rate of the freelancer.
  - `discount`: The discount rate as a percentage.

  ## Returns

  - The monthly rate as a number, rounded up to the nearest whole number.
  """
  @spec monthly_rate(number(), number()) :: number()
  def monthly_rate(hourly_rate, discount) do
    (@billable_days * daily_rate(apply_discount(hourly_rate, discount))) |> ceil
  end

  @doc """
  Calculates the number of days a freelancer can work given a budget, their hourly rate, and a discount.

  ## Parameters

  - `budget`: The total budget available.
  - `hourly_rate`: The hourly rate of the freelancer.
  - `discount`: The discount rate as a percentage.

  ## Returns

  - The number of days the freelancer can work within the budget as a float, rounded down to one decimal place.
  """
  @spec days_in_budget(number(), number(), number()) :: float()
  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / daily_rate(apply_discount(hourly_rate, discount)), 1)
  end
end
