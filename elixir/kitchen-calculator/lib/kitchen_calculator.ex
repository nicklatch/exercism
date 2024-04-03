defmodule KitchenCalculator do
  def get_volume({_, vol}), do: vol

  def to_milliliter({unit, vol}) do
    case unit do
      :cup -> {:milliliter, vol * 240}
      :fluid_ounce -> {:milliliter, vol * 30}
      :teaspoon -> {:milliliter, vol * 5}
      :tablespoon -> {:milliliter, vol * 15}
      :milliliter -> {:milliliter, vol}
    end
  end

  def from_milliliter({_, vol}, unit) do
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
