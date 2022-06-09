defmodule RepoScouterWeb.Controllers.User.Create do
  use RepoScouterWeb.ConnCase, async: true

  import Mox

  describe "index/2" do
    test "When given a password as parameter create the user and return an identifier", %{
      conn: conn
    } do
      resp = post(conn, Routes.create_path(conn, :index), password: "senha123")

      assert body = json_response(resp, :ok)

      assert %{
               "message" => "Usuário criado com sucesso",
               "data" => %{"identificador" => identifier}
             } = body

      assert is_bitstring(identifier)
    end
  end
end
