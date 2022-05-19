ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(RepoScouter.Repo, :manual)

Mox.defmock(GithubClient.ClientMock, for: RepoScouter.GithubClient.Behaviour)

Application.put_env(:repo_scouter, :github_client, GithubClient.ClientMock)
