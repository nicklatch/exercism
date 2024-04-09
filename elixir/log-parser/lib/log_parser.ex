defmodule LogParser do
  @moduledoc """
  Contains functions for parsing log file lines.
  """

  @doc """
  Inspect the given line returnng true if it follows
  the "[LVL] msg" format, else false.
  """
  @spec valid_line?(line :: String.t()) :: boolean()
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\].*/
  end

  @doc """
  Splits the given line at a pair of angle brackets with
  either ~, *, =, or - inside of them.
  """
  @spec split_line(line :: String.t()) :: [String.t()]
  def split_line(line) do
    String.split(line, ~r/<[~*=-]*>/)
  end

  @doc """
  Removes "end-of-line[NUMBER]" if found.
  """
  @spec remove_artifacts(line :: String.t()) :: String.t()
  def remove_artifacts(line) do
    Regex.replace(~r/end\-of\-line[\d]+/i, line, "")
  end


  @doc """
  If the given line contains the word "User", it is repalced with
  "[USER]" followed by the user name and message.
  """
  @spec tag_with_user_name(line :: String.t()) :: String.t()
  def tag_with_user_name(line) do
    case Regex.scan(~r/User\s+(\S+)/u, line) do
      [[_, username]] -> "[USER] #{username} #{line}"
      _ -> line
    end
  end
end
