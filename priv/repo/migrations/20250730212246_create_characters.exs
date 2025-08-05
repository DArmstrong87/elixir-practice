defmodule ElixirPractice.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string, null: false
      add :movie_id, references(:movies, on_delete: :delete_all), null: false
    end
  end
end
