defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.replace(["\s", "\n", "\r", "\t"], "") |> String.first()
  end

  def initial(name), do: first_letter(String.upcase(name)) <> "."

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name)
    initial(first_name) <> " " <> initial(last_name)
  end

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
