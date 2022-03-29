defmodule Imdb.Repo.Migrations.CreateTitle do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :imdb_title_id, :string, null: false
      add :title, :string, null: false
      add :original_title, :string
      add :year, :string
      add :date_published, :string, null: false
      add :genre, :string
      add :duration, :integer
      add :country, :string
      add :language, :string
      add :writer, :string
      add :production_company, :string
      add :description, :string
      add :budget, :integer
      add :usa_gross_income, :integer
      add :worlwide_gross_income, :integer
      add :metascore, :integer
      timestamps()
    end

    create unique_index(:movies, [:imdb_title_id])
  end
end
