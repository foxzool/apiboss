defmodule APIBoss.Config do
  @moduledoc false

  @default_options [
    http:  [ port: 4000 ],
    https: [ certfile: "",
             keyfile: "",
             port: 4443 ]
  ]

  @spec get(atom) :: any
  def get(module) when module != :apiboss do
    get(:apiboss, module)
  end

  @spec get(atom, atom) :: any
  def get(:apiboss, key) do
    _get(key)
  end
  def get(module, key) do
    _get(module)[key]
  end

  @spec get(atom, atom, any) :: any
  def get(:apiboss, key, default) do
    get(:apiboss, key) || default
  end
  def get(module, key, default) do
    get(module, key) || default
  end

  defp _get(key) do
    env = Application.get_env(:apiboss, key)
    if is_list(env) do
      @default_options |> Keyword.merge(env)
    else
      env
    end
  end
end
