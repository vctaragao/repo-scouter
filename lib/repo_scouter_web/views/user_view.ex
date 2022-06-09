defmodule RepoScouterWeb.UserView do
  use RepoScouterWeb, :view

  def render("create.json", %{user: user}) do
    %{
      message: "Usuário criado com sucesso",
      data: %{
        identificador: user.identifier
      }
    }
  end
end
