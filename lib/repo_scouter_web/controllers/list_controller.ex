defmodule RepoScouterWeb.ListController do
  use RepoScouterWeb, :controller

  @validation %{
    username: [type: :string, length: [mix: 3]]
  }

  def index(conn, params) do
    with {:ok, %{username: username}} <- Params.validate(params, @validation),
         {:ok, repos} <- RepoScouter.get_repos(%{username: username}) do
      conn
      |> put_status(:ok)
      |> render("list.json", repos: repos)
    end
  end
end
