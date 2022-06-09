defmodule RepoScouter.Repository.Get do
  alias RepoScouter.Repository

  def call(%{username: username}) do
    case github_client().get_repos(username) do
      {:error, reason} -> {:error, reason}
      {:ok, repos} -> {:ok, build_repo_schema(repos)}
    end
  end

  defp build_repo_schema(repos), do: Enum.map(repos, &Repository.build/1)

  defp github_client() do
    Application.get_env(:repo_scouter, :github_client)
  end
end
