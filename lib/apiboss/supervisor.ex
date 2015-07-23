defmodule APIBoss.Supervisor do
  @moduledoc """
  base supervisor
  """
  use Supervisor

  @doc """
  start the supervisor
  """
  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  @doc """
  start children
  """
  def init(opts) do
    children = []
    opts = Keyword.put(opts, :strategy, :one_for_one)

    supervise(children, opts)
  end

end
