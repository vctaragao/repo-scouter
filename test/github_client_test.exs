defmodule RepoScouter.GithubClientTest do
  use RepoScouterWeb.ConnCase, async: true

  alias RepoScouter.GithubClient.Client

  describe "get_repos/1" do
    test "When given a valid username return their repos" do
      assert {:ok, repos} = Client.get_repos("vctaragao")
      assert 21 == length(repos)
    end

    test "When given an invalid username return an error" do
      assert {:error, "Invalid username"} = Client.get_repos("vc_taragao")
    end

    test "When given an empty username return an error" do
      assert {:error, "Invalid username"} = Client.get_repos("")
    end
  end
end
