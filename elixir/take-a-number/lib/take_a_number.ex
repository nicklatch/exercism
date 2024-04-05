defmodule TakeANumber do
  @doc """
  Spawns a new process and returns its PID
  """
  @spec start() :: pid()
  def start(), do: spawn(fn -> listen(0) end)

  defp listen(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        listen(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        listen(state + 1)

      :stop ->
        nil

      _ ->
        listen(state)
    end
  end
end
