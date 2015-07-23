defmodule APIBoss do
  use Application

  @doc """
  Start the application
  """
  @spec start() :: :ok
  def start do
    case :application.start(:apiboss) do
      :ok -> :ok
      {:error, {:already_started, :apiboss}} -> :ok
    end
  end

  @doc """
  start/2 for Supervisor
  """
  @spec start(atom, Keyword.t) :: {:ok, pid}
  def start(_type, _args) do
    :ok = Application.ensure_started(:plug)

    APIBoss.Supervisor.start_link
  end

end
