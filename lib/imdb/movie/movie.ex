defmodule Imdb.Movie.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :imdb_title_id, :string
    field :title, :string
    field :original_title, :string
    field :year, :string
    field :date_published, :string
    field :genre, :string
    field :duration, :integer
    field :country, :string
    field :language, :string
    field :writer, :string
    field :production_company, :string
    field :description, :string
    field :budget, :string
    field :usa_gross_income, :string
    field :worlwide_gross_income, :string
    field :metascore, :string
    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [
      :imdb_title_id,
      :title,
      :original_title,
      :year,
      :date_published,
      :genre,
      :duration,
      :country,
      :language,
      :writer,
      :production_company,
      :description,
      :budget,
      :usa_gross_income,
      :worlwide_gross_income,
      :metascore
    ])
    |> validate_required([:imdb_title_id, :title])
    |> unique_constraint(:imdb_title_id)
  end
end
