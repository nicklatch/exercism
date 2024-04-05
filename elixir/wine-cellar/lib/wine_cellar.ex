defmodule WineCellar do
  @doc """
  Returns a keyword list of wine colors and their descriptions
  """
  @spec explain_colors() :: [{:white, <<_::248>>} | {:red, <<_::432>>} | {:rose, <<_::608>>}, ...]
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  @doc """
  Returns a list of wines filtered by the given color and options (if present).
  """
  @spec filter(keyword(), atom()) :: [] | [{String.t(), integer(), String.t()}, ...]
  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |> filter_by_year(opts[:year])
    |> filter_by_country(opts[:country])
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year(wines, nil), do: wines

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country(wines, nil), do: wines
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
