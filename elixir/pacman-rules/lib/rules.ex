defmodule Rules do
  @moduledoc """
  This module provides functions that determine the outcome of a game of pacman.

  ## Functions

  - `eat_ghost?/2`: Determines if a ghost can be eaten.
  - `score?/2`: Determines if the player scores.
  - `lose?/2`: Determines if the player loses.
  - `win?/3`: Determines if the player wins.
  """

  @doc """
  Determines if a ghost can be eaten.

  ## Parameters

  - `power_pellet_active?`: A boolean indicating if the power pellet is active.
  - `touching_ghost?`: A boolean indicating if the player is touching a ghost.

  ## Returns

  - A boolean indicating if the ghost can be eaten.
  """
  @spec eat_ghost?(boolean(), boolean()) :: boolean()
  def eat_ghost?(power_pellet_active?, touching_ghost?) do
    power_pellet_active? and touching_ghost?
  end

  @doc """
  Determines if the player scores.

  ## Parameters

  - `touching_power_pellet?`: A boolean indicating if the player is touching a power pellet.
  - `touching_dot?`: A boolean indicating if the player is touching a dot.

  ## Returns

  - A boolean indicating if the player scores.
  """
  @spec score?(boolean(), boolean()) :: boolean()
  def score?(touching_power_pellet?, touching_dot?) do
    touching_power_pellet? or touching_dot?
  end

  @doc """
  Determines if the player loses.

  ## Parameters

  - `power_pellet_active?`: A boolean indicating if the power pellet is active.
  - `touching_ghost?`: A boolean indicating if the player is touching a ghost.

  ## Returns

  - A boolean indicating if the player loses.
  """
  @spec lose?(boolean(), boolean()) :: boolean()
  def lose?(power_pellet_active?, touching_ghost?) do
    not power_pellet_active? and touching_ghost?
  end

  @doc """
  Determines if the player wins.

  ## Parameters

  - `has_eaten_all_dots?`: A boolean indicating if the player has eaten all dots.
  - `power_pellet_active?`: A boolean indicating if the power pellet is active.
  - `touching_ghost?`: A boolean indicating if the player is touching a ghost.

  ## Returns

  - A boolean indicating if the player wins.
  """
  @spec win?(boolean(), boolean(), boolean()) :: boolean()
  def win?(has_eaten_all_dots?, power_pellet_active?, touching_ghost?) do
    has_eaten_all_dots? and not lose?(power_pellet_active?, touching_ghost?)
  end
end
