defmodule RepoScouter.GitHubClient do
  use Tesla

  @base_url "https://api.github.com"

  plug Tesla.Middleware.BaseUrl, @base_url
  plug Tesla.Middleware.JSON

  def get_repos(username), do: get(@base_url <> "/users/#{username}/repos") |> handle_response()

  defp handle_response({:ok, %{status: 404}}), do: {:error, "Invalid username"}
  defp handle_response({:ok, %{status: 200} = response}), do: {:ok, response.body}
end
