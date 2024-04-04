defmodule RPG.CharacterSheet do
  @doc """
  Prints the welcome message and retruns :ok.
  """
  @spec welcome() :: :ok
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @doc """
  Asks for character's name and returns the trimmed input.
  """
  @spec ask_name() :: String.t()
  def ask_name() do
    IO.gets("What is your character's name?\n") |> String.trim()
  end

  @doc """
  Asks for character's class and returns the trimmed input. 
  """
  @spec ask_class() :: String.t()
  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim()
  end

  @doc """
  Asks for character's level and returns it as an integer.
  """
  @spec ask_level() :: integer()
  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> String.trim()
    |> String.to_integer()
  end

  @doc """
  Runs welcome(), ask_name(), ask_class(), and ask_level(); aggregating them into a map.
  The map is then printed and returned.
  """
  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    IO.inspect(%{name: name, class: class, level: level}, label: "Your character")
  end
end
