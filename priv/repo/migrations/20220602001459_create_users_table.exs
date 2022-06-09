defmodule RepoScouter.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table("user") do
      add :identifier, :string
      add :password, :string

      timestamps()
    end
  end
end
