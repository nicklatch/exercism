defmodule NameBadge do
  @moduledoc """
  Contains a function for creating a name badge
  """

  @doc """
  Given an id, name, and department, a name badge containing all three will be returned.

  If the id is omitted, just the name and department will be submitted.

  If no department is given, this indecates that it's the owner department will default to "OWNER".
  """
  @spec print(id :: nil | non_neg_integer(), name :: String.t(), department :: nil | String.t()) ::
          String.t()
  def print(id, name, department) do
    dep = if department, do: String.upcase(department), else: "OWNER"

    if id do
      "[#{id}] - #{name} - #{dep}"
    else
      "#{name} - #{String.upcase(dep)}"
    end
  end
end
