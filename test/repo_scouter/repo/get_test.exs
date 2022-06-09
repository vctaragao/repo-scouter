defmodule RepoScouter.Repository.GetTest do
  use RepoScouter.DataCase, async: true

  import Mox

  alias RepoScouter.Repository.Get
  alias RepoScouter.Repository

  setup :verify_on_exit!

  describe "get_repos/1" do
    test "When given a valid username return their repos" do
      expect(GithubClient.ClientMock, :get_repos, fn _ ->
        {:ok, [%{"name" => "repo_mock", "language" => "php", "url" => "url"}]}
      end)

      assert {:ok, [%Repository{} | _] = repos} = Get.call(%{username: "vctaragao"})

      assert 1 == length(repos)
    end

    test "When given an invalid username handle error" do
      expect(GithubClient.ClientMock, :get_repos, fn _ -> {:error, "Invalid username"} end)

      assert {:error, "Invalid username"} = Get.call(%{username: "vct-aragao"})
    end
  end
end
