defmodule Imdb.Repo.Migrations.CreateName do
  use Ecto.Migration

  def change do
    create table(:names) do
      add :imdb_name_id, :string, null: false
      add :name, :text, null: false
      add :birth_name, :text
      add :height, :text
      add :bio, :text
      add :birth_details, :text
      add :date_of_birth, :string
      add :place_of_birth, :text
      add :death_details, :text
      add :date_of_death, :text
      add :place_of_death, :text
      add :reason_of_death, :text
      add :spouses_string, :text
      add :spouses, :text
      add :divorces, :text
      add :spouses_with_children, :text
      add :children, :text
    end
    create unique_index(:names, [:imdb_name_id])
  end
end
