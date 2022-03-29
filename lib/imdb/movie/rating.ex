defmodule Imdb.Movie.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ratings" do
    field :imdb_title_id, :string
    field :weighted_average_vote, :float
    field :total_votes, :integer
    field :mean_vote, :float
    field :median_vote, :float

    timestamps()
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [
      :imdb_title_id,
      :weighted_average_vote,
      :total_votes,
      :mean_vote,
      :median_vote,
    ])
    |> validate_required([:imdb_title_id])
    |> unique_constraint(:imdb_title_id)
  end
end
