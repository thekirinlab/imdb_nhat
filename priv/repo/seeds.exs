# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Imdb.Repo.insert!(%Imdb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Imdb.Participant.Name
alias Imdb.Movie.Principal
alias Imdb.Movie.Rating
alias Imdb.Movie.Movie
alias Imdb.Repo

NimbleCSV.define(MyParser, separator: ",", escape: "\"")

NAME
defmodule Imdb.Seeds do
  def store_data(row) do
    changeset = Name.changeset(%Name{}, row)
    Repo.insert_all(names, changeset)
  end
end

File.stream!("C:/Users/Admin/Desktop/IMDB movies dataset/IMDB movies dataset/IMDb names.csv")
|> Stream.drop(1)
|> NimbleCSV.RFC4180.parse_stream()
|> Stream.map(fn [imdb_name_id, name, birth_name, height, bio, birth_details, date_of_birth, place_of_birth, death_details, date_of_death, place_of_death, reason_of_death, spouses_string, spouses, divorces, spouses_with_children, children] ->
  %{
    imdb_name_id: :binary.copy(imdb_name_id),
    name: :binary.copy(name),
    birth_name: :binary.copy(birth_name),
    height: :binary.copy(height),
    bio: :binary.copy(bio),
    birth_details: :binary.copy(birth_details),
    date_of_birth: :binary.copy(date_of_birth),
    place_of_birth: :binary.copy(place_of_birth),
    death_details: :binary.copy(death_details),
    date_of_death: :binary.copy(date_of_death),
    place_of_death: :binary.copy(place_of_death),
    reason_of_death: :binary.copy(reason_of_death),
    spouses_string: :binary.copy(spouses_string),
    spouses: :binary.copy(spouses),
    divorces: :binary.copy(divorces),
    spouses_with_children: :binary.copy(spouses_with_children),
    children: :binary.copy(children)
  }
end)
|> Enum.to_list()
|> Enum.each(&Imdb.Seeds.store_data/1)


# # PRINCIPAL
# defmodule Imdb.Seeds do
#   def store_data(row) do
#     changeset = Principal.changeset(%Principal{}, row)
#     Repo.insert_all(principals, changeset)
#   end
# end

# File.stream!(
#   "C:/Users/Admin/Desktop/IMDB movies dataset/IMDB movies dataset/IMDb title_principals.csv"
# )
# |> Stream.drop(1)
# # |> CSV.decode(
# #   headers: [
# #     :imdb_title_id,
# #     :ordering,
# #     :imdb_name_id,
# #     :category,
# #     :job,
# #     :characters
# #   ]
# # )
# |> NimbleCSV.RFC4180.parse_stream()
# |> Stream.map(fn [imdb_title_id, ordering, imdb_name_id, category, job, characters] ->
#   %{
#     imdb_title_id: :binary.copy(imdb_title_id),
#     ordering: :binary.copy(ordering),
#     imdb_name_id: :binary.copy(imdb_name_id),
#     category: :binary.copy(category),
#     job: :binary.copy(job),
#     characters: :binary.copy(characters)
#   }
# end)
# |> Enum.to_list()
# |> Enum.each(&Imdb.Seeds.store_data/1)

# # RATING
# defmodule Imdb.Seeds do
#   def store_data(row) do
#     changeset = Rating.changeset(%Rating{}, row)
#     Repo.insert_all(ratings, changeset)
#   end
# end

# File.stream!("C:/Users/Admin/Desktop/IMDB movies dataset/IMDB movies dataset/IMDb ratings.csv")
# |> Stream.drop(1)
# # |> NimbleCSV.RFC4180.parse_stream()
# |> CSV.decode(
#   headers: [
#     :imdb_title_id,
#     :weighted_average_vote,
#     :total_votes,
#     :mean_vote,
#     :median_vote
#   ]
# )
# # |> Stream.map(fn [imdb_title_id, weighted_average_vote, total_votes, mean_vote, median_vote] ->
# #   %{
# #     imdb_title_id: :binary.copy(imdb_title_id),
# #     weighted_average_vote: :binary.copy(weighted_average_vote),
# #     total_votes: :binary.copy(total_votes),
# #     mean_vote: :binary.copy(mean_vote),
# #     median_vote: :binary.copy(median_vote)
# #   }
# # end)
# # |> Enum.to_list()
# |> Enum.each(&Imdb.Seeds.store_data/1)

# MOVIE
# defmodule Imdb.Seeds do
#   def store_data(row) do
#     changeset = Movie.changeset(%Movie{}, row)
#     Repo.insert_all(movies, changeset)
#   end
# end

# File.stream!("C:/Users/Admin/Desktop/IMDB movies dataset/IMDB movies dataset/IMDb_re_movies.csv")
# |> Stream.drop(1)
# |> CSV.decode(
#   headers: [
#     :imdb_title_id,
#     :title,
#     :original_title,
#     :year,
#     :date_published,
#     :genre,
#     :duration,
#     :country,
#     :language,
#     :writer,
#     :production_company,
#     :description,
#     :budget,
#     :usa_gross_income,
#     :worlwide_gross_income,
#     :metascore
#   ]
# )
# |> Enum.each(&Imdb.Seeds.store_data/1)
