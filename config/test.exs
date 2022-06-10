import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :repo_scouter, RepoScouter.Repo,
  username: "repo",
  password: "123456789",
  hostname: "localhost",
  database: "repo_scouter#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :repo_scouter, RepoScouterWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MOwslvgRp/yrprylNEiqSDLotHrnYks+LcQHB/51D9XaTjK41NXXr5Z/RyIPe10E",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :bcrypt_elixir, log_rounds: 4
