defmodule HighSchoolSweetheart do
  @spec first_letter(String.t()) :: String.t()
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  @spec initial(Strting.t()) :: String.t()
  def initial(name), do: name |> first_letter() |> String.upcase() |> Kernel.<>(".")

  @spec initials(Strting.t()) :: String.t()
  def initials(full_name) do
    [first_name, last_name] = String.split(full_name)
    "#{initial(first_name)} #{initial(last_name)}"
  end

  @spec pair(String.t(), String.t()) :: String.t()
  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     X. X.  +  Y. Y.     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
    |> String.replace("X. X.", initials(full_name1))
    |> String.replace("Y. Y.", initials(full_name2))
  end
end
