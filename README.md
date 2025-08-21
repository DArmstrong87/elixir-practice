# ElixirPractice

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_practice` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_practice, "~> 0.1.0"}
    
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elixir_practice>.


## Commands
| Command | Action |
| -- | -- |
| `mix new <APP_NAME> --sup` | Create a new app with supervision tree |
| `mix deps.get` | Install dependencies from mix.exs |
| `mix ecto.gen.repo -r RepoName.Repo` | Set up a repository. This will generate the configuration required in config/config.exs to connect to a database including the adapter to use. |
| `mix ecto.create` | Creates the database using the info in `config/config.exs` |
| `mix ecto.gen.migration create_my_table` | Generates a migration file in `priv/repo/migrations` prepended with a timestamp (`20250730191447_create_people.exs`) |
| `mix ecto.migrate` | Run migrations |
| `mix ecto.rollback` | Rollback previous migration |
| `mix ecto.reset` | Resets the database |
| `iex` | Run Interactive Elixir Shell |
| `mix archive.install hex phx_new` | Install Phoenix for Phoenix web servers |
| `mix phx.new project-name` | Create a new Phoenix project |
| `iex -S mix phx.server` | `-S mix`: Runs the Mix build tool when starting iex. `phx.server`: Tells Mix to run the Phoenix server task, starting your web application. |
