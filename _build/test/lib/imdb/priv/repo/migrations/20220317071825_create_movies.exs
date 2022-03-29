defmodule Imdb.Repo.Migrations.CreateMovie do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :imdb_title_id, :string, null: false
      add :title, :string, null: false
      add :original_title, :string
      add :year, :string
      add :date_published, :string
      add :genre, :string
      add :duration, :integer
      add :country, :string
      add :language, :string
      add :writer, :string
      add :production_company, :string
      add :description, :text
      add :budget, :string
      add :usa_gross_income, :string
      add :worlwide_gross_income, :string
      add :metascore, :string
      timestamps()
    end

    create unique_index(:movies, [:imdb_title_id])
  end
end
