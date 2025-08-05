import Config

config :elixir_practice, ElixirPractice.Repo,
  database: "elixir_practice_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5433

config :elixir_practice, ecto_repos: [ElixirPractice.Repo]
