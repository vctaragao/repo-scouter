defmodule RepoScouterWeb.Controllers.ListControllerTest do
  use RepoScouterWeb.ConnCase, async: true

  import Mox

  @valid_username "vctaragao"

  describe "index/2" do
    test "When given a valid username return a list of repos", %{conn: conn} do
      expect(GithubClient.ClientMock, :get_repos, fn _ ->
        {:ok, [%{"name" => "repo_mock", "language" => "php", "url" => "url"}]}
      end)

      response = get(conn, Routes.list_path(conn, :index, @valid_username))

      assert body = json_response(response, :ok)

      assert %{
               "message" => "Lista de repositórios retornada com sucesso",
               "data" => repos
             } = body

      assert length(repos) == 1
    end
  end
end
