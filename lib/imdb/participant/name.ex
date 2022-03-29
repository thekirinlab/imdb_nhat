defmodule Imdb.Participant.Name do
  use Ecto.Schema
  import Ecto.Changeset

  schema "names" do
    field :imdb_name_id, :string
    field :name, :string
    field :birth_name, :string
    field :height, :string
    field :bio, :string
    field :birth_details, :string
    field :date_of_birth, :string
    field :place_of_birth, :string
    field :death_details, :string
    field :date_of_death, :string
    field :place_of_death, :string
    field :reason_of_death, :string
    field :spouses_string, :string
    field :spouses, :string
    field :divorces, :string
    field :spouses_with_children, :string
    field :children, :string
  end

  @doc false
  def changeset(name, attrs) do
    name
    |> cast(attrs, [
      :imdb_name_id,
      :name,
      :birth_name,
      :height,
      :bio,
      :birth_details,
      :date_of_birth,
      :place_of_birth,
      :death_details,
      :date_of_death,
      :place_of_death,
      :reason_of_death,
      :spouses_string,
      :spouses,
      :divorces,
      :spouses_with_children,
      :children
    ])
    |> validate_required([:imdb_name_id, :name])
    |> unique_constraint(:imdb_name_id)
  end
end
