defmodule RepoScouter.Facade do
  alias RepoScouter.Repository.Get
  alias RepoScouter.User.Create, as: UserCreate

  defdelegate get_repos(params), to: Get, as: :call
  defdelegate create_user(params), to: UserCreate, as: :call
end
