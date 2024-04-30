defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, & &1.price, :asc)

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, count) do
    %{
      item
      | quantity_by_size:
          item.quantity_by_size
          |> Enum.into(%{}, fn {size, qty} ->
            {size, qty + count}
          end)
    }
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Map.values()
    |> Enum.reduce(0, &+/2)
  end
end
