defmodule RepoScouter.User do
  use Ecto.Schema

  import Ecto.Changeset
  import Bcrypt

  alias Ecto.Changeset

  @fields [:identifier, :password, :password_hash]
  @required_field @fields -- [:password_hash]

  @derive {Jason.Encoder, only: [:identifier]}

  schema "user" do
    field :identifier, :string
    field :password, :string
    field :password_hash, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@required_field)
    |> change(add_hash(params[:password]))
    |> handler_changeset()
  end

  defp handler_changeset(%Changeset{} = changeset) do
    if changeset.valid? do
      {:ok, changeset}
    else
      handler_error(changeset.errors)
    end
  end

  defp handler_error([field, {reason, [{key, value} | _]} | _]) do
    reason = if String.contains?(reason, "%"), do: format_reason(reason, key, value), else: reason

    {:error, info: %{field: Atom.to_string(field), reason: reason}}
  end

  defp format_reason(reason, key, value) when is_integer(value) do
    String.replace(reason, "%{#{key}}", Integer.to_string(value))
  end
end
