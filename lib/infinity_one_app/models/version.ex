defmodule InfinityOneApp.Version do
  use OneModel, schema: InfinityOneApp.Schema.Version

  def insert_or_update(%{name: name} = params) do
    case get_by(name: name, preload: [:assets]) do
      nil -> change(params)
      version -> change(version, params)
    end
    |> @repo.insert_or_update
  end
end
