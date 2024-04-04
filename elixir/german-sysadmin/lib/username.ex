defmodule Username do
  @doc """
  Replaces german characters with latin subsitute and removes all other characters that are not underscores.
  """
  @spec sanitize([] | charlist()) :: [] | charlist()
  def sanitize([]), do: []

  def sanitize([first_ch | rest]) do
    cleaned_and_subbed =
      case first_ch do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        char when char >= ?a and char <= ?z -> [char]
        ?_ -> ~c"_"
        _ -> ~c""
      end

    cleaned_and_subbed ++ sanitize(rest)
  end
end
