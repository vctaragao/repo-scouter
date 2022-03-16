defmodule RepoScouter.RepositoryTest do
  use RepoScouter.DataCase, async: true

  alias RepoScouter.Repository

  describe "build/1" do
    test "When given a valid username return their repos" do
      expected_struct = %Repository{
        language: "JavaScript",
        name: "api-conversao",
        url: "https://api.github.com/repos/vctaragao/api-conversao"
      }

      assert expected_struct ==
               Repository.build(%{
                 "name" => "api-conversao",
                 "url" => "https://api.github.com/repos/vctaragao/api-conversao",
                 "language" => "JavaScript"
               })
    end
  end
end
