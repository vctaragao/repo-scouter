defmodule RepoScouterWeb.Controllers.ListControllerTest do
  use RepoScouterWeb.ConnCase, async: true

  @valid_username "vctaragao"

  describe "index/2" do
    test "When given a valid username return a list of repos" do
      response = Router.list_path(conn, :index, @valid_username)

      assert body = json_reponse(response, :ok)

      assert %{
               message: "Lista de repositórios retornada com sucesso",
               data: %{repos: repos}
             } = body

      assert length(repos) == 20
    end
  end
end
