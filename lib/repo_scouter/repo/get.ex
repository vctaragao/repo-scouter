defmodule RepoScouter.Repo.Get do
  alias RepoScouter.GitHubClient
  alias RepoScouter.Repository

  def call(%{username: username}) do
    case GitHubClient.get_repos(username) do
      {:error, reason} -> {:error, reason}
      {:ok, repos} -> {:ok, build_repo_schema(repos)}
    end
  end

  defp build_repo_schema(repos), do: Enum.map(repos, &Repository.build/1)
end
