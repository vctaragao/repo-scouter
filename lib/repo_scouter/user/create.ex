defmodule RepoScouter.User.Create do
  alias RepoScouter.User
  alias RepoScouter.Repo

  def call(%{password: password} = params) when is_bitstring(password) do
    with completed_params <- Map.put_new(params, :identifier, UUID.uuid4()),
         {:ok, changeset} <- User.changeset(completed_params),
         {:ok, user} <- Repo.insert(changeset) do
      {:ok, user}
    end
  end

  def call(_), do: {:error, "Can't create user", reason: "invalid params"}
end
