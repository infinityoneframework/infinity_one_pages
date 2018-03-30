defmodule InfinityOneApp.Github do
  use HTTPoison.Base

  @endpoint "https://api.github.com"
  @project "/repos/infinityoneframework/infinityone-electron"

  def process_url(url) do
    @endpoint <> @project <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    # |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
    |> Enum.into(%{})
  end

  def latest do
    get! "/releases/latest"
  end

end
