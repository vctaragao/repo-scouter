defmodule RepoScouter.Repo do
  use Ecto.Repo,
    otp_app: :repo_scouter,
    adapter: Ecto.Adapters.Postgres
end
