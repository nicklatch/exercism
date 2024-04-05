defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  defp s_to_y(seconds), do: seconds / 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) when planet == :mercury, do: {:ok, s_to_y(seconds) / 0.2408467}
  def age_on(planet, seconds) when planet == :venus, do: {:ok, s_to_y(seconds) / 0.61519726}
  def age_on(planet, seconds) when planet == :earth, do: {:ok, s_to_y(seconds)}
  def age_on(planet, seconds) when planet == :mars, do: {:ok, s_to_y(seconds) / 1.8808158}
  def age_on(planet, seconds) when planet == :jupiter, do: {:ok, s_to_y(seconds) / 11.862615}
  def age_on(planet, seconds) when planet == :saturn, do: {:ok, s_to_y(seconds) / 29.447498}
  def age_on(planet, seconds) when planet == :uranus, do: {:ok, s_to_y(seconds) / 84.016846}
  def age_on(planet, seconds) when planet == :neptune, do: {:ok, s_to_y(seconds) / 164.79132}
  def age_on(_planet, _seconds), do: {:error, "not a planet"}
end
