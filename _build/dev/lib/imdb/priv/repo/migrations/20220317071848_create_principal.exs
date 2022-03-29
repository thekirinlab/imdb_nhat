defmodule Imdb.Repo.Migrations.CreatePrincipal do
  use Ecto.Migration

  def change do
    create table(:principals) do
      add :imdb_title_id, :string, null: false
      add :ordering, :integer, null: false
      add :imdb_name_id, :string, null: false
      add :category, :string, null: false
      add :job, :string
      add :characters, :string
      timestamps()
    end
  end
end
