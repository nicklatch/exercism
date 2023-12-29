defmodule LogLevel do
  @moduledoc """
    A module for handling log levels.

    Provides functions to convert numeric log levels to symbolic labels(including legacy), determine the recipient of an alert based on the log level.
  """

  @doc """
  Converts a numeric log level to a symbolic label.

  ## Params

  - `level`: The numeric log level.
  - `legacy?`: A boolean flag indicating whether the log level is from a legacy system.

  ## Returns

  Returns a symbolic label for the log level. If the level is out of range or if it's a legacy level 0 or 5, it returns :unknown.
  """
  @spec to_label(integer(), boolean()) ::
          :debug | :error | :fatal | :info | :trace | :unknown | :warning
  def to_label(level, legacy?) do
    cond do
      level < 0 or level > 5 -> :unknown
      legacy? and (level == 0 or level == 5) -> :unknown
      not legacy? or (level > 0 && level < 5) -> code_to_label(level)
    end
  end

  @doc """
  Determines the recipient of an alert based on the log level and whether it's from a legacy system.

  ## Params

  - `level`: The numeric log level.
  - `legacy?`: A boolean flag indicating whether the log level is from a legacy system.

  ## Returns

  Returns a symbolic label for the recipient. If the level is unknown, it returns :dev1 for legacy levels and :dev2 for non-legacy. For error and fatal levels, it returns :ops. For all other levels, it returns false.
  """
  @spec alert_recipient(integer(), boolean()) :: :dev1 | :dev2 | false | :ops
  def alert_recipient(level, legacy?) do
    labeled = to_label(level, legacy?)

    case {legacy?, labeled} do
      {true, :unknown} -> :dev1
      {false, :unknown} -> :dev2
      {_, :error} -> :ops
      {_, :fatal} -> :ops
      _ -> false
    end
  end

  defp code_to_label(level) do
    case level do
      0 -> :trace
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
      5 -> :fatal
      _ -> :unknown
    end
  end
end
