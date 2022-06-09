defmodule RepoScouterWeb.Controller.User.Create do
  use RepoScouterWeb, :controller

  alias RepoScouterWeb.UserView

  def index(conn, %{"password" => password}) when is_bitstring(password) do
    with {:ok, user} <- RepoScouter.create_user(%{password: password}) do
      conn
      |> put_status(:ok)
      |> put_view(UserView)
      |> render("create.json", user: user)
    end
  end
end
