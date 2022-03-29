defmodule Imdb.Repo.Migrations.CreateRating do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :imdb_title_id, :string, null: false
      add :weighted_average_vote, :float
      add :total_votes, :integer
      add :mean_vote, :float
      add :median_vote, :float

      timestamps()
    end

    create unique_index(:ratings, [:imdb_title_id])
  end
end
