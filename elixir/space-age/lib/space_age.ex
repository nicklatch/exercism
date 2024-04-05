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

  @earth_divisor %{
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  # A helper function the turns the given seconds into age on earth in years
  @spec s_to_y(seconds :: float()) :: float()
  defp s_to_y(seconds), do: seconds / 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet :: planet(), seconds :: pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(:earth, seconds), do: {:ok, s_to_y(seconds)}

  def age_on(planet, seconds) when is_map_key(@earth_divisor, planet) do
    {:ok, s_to_y(seconds) / @earth_divisor[planet]}
  end

  def age_on(_planet, _seconds), do: {:error, "not a planet"}
end
