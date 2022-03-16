defmodule RepoScouter.GitHubClientTest do
  use RepoScouterWeb.ConnCase, async: true

  alias RepoScouter.GitHubClient

  describe "get_repos/1" do
    test "When given a valid username return their repos" do
      assert {:ok, repos} = GitHubClient.get_repos("vctaragao")

      assert 20 == length(repos)
    end

    test "When given an invalid username return an error" do
      assert {:error, "Invalid username"} = GitHubClient.get_repos("vc_taragao")
    end

    test "When given an empty username return an error" do
      assert {:error, "Invalid username"} = GitHubClient.get_repos("")
    end
  end
end
