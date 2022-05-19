defmodule RepoScouter.GithubClient.Behaviour do
  @callback get_repos(map()) :: {:ok, list()} | {:error, binary()}
end
