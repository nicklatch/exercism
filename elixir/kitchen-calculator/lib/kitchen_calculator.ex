defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    {unit, vol} = volume_pair

    case unit do
      :cup -> {:milliliter, vol * 240}
      :fluid_ounce -> {:milliliter, vol * 30}
      :teaspoon -> {:milliliter, vol * 5}
      :tablespoon -> {:milliliter, vol * 15}
      :milliliter -> {:milliliter, vol}
    end
  end

  def from_milliliter(volume_pair, unit) do
    {_, vol} = volume_pair

    case unit do
      :cup -> {:cup, vol / 240}
      :fluid_ounce -> {:fluid_ounce, vol / 30}
      :teaspoon -> {:teaspoon, vol / 5}
      :tablespoon -> {:tablespoon, vol / 15}
      :milliliter -> {:milliliter, vol}
    end
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) |> from_milliliter(unit)
  end
end
