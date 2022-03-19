defmodule RepoScouterWeb.RepoView do
  use RepoScouterWeb, :view

  def render("list.json", %{repos: _} = repos) do
    %{
      message: "Lista de repositórios retornada com sucesso",
      data: repos
    }
  end
end
