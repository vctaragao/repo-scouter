defmodule RepoScouter.Repo.GetTest do
  use RepoScouter.DataCase, async: true

  alias RepoScouter.Repo.Get
  alias RepoScouter.Repository

  describe "get_repos/1" do
    test "When given a valid username return their repos" do
      assert {:ok, [%Repository{} | _] = repos} = Get.call(%{username: "vctaragao"})

      assert 20 == length(repos)
    end
  end
end
