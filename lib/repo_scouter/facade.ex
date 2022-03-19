defmodule RepoScouter.Facade do
  alias RepoScouter.Repo.Get

  defdelegate get_repos(params), to: Get, as: :call
end
