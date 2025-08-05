defmodule ElixirPractice.Repo do
  use Ecto.Repo,
    otp_app: :elixir_practice,
    adapter: Ecto.Adapters.Postgres
end
