defmodule Imdb.Movie.Principal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "principals" do
    field :imdb_title_id, :string
    field :ordering, :integer
    field :imdb_name_id, :string
    field :category, :string
    field :job, :string
    field :characters, :string
    timestamps()
  end

  @doc false
  def changeset(pricipal, attrs) do
    pricipal
    |> cast(attrs, [
      :imdb_title_id,
      :ordering,
      :imdb_name_id,
      :category,
      :job,
      :characters
    ])
    |> validate_required([:imdb_title_id, :ordering, :imdb_name_id, :category])
  end
end
