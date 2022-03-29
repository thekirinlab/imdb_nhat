ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Imdb.Repo, :manual)

defmodule Imdb.TestHelpers do
  alias Imdb.Movie.Movie
  alias Imdb.Movie.Principal
  alias Imdb.Movie.Rating
  alias Imdb.Participant.Name
  alias Imdb.Repo

  def insert_movie(imdb_title_id, title) do
    Repo.insert(%Movie{
        imdb_title_id: imdb_title_id,
        title: title,
        original_title: "Miss Jerry",
        year: "1894",
        date_published: "1894-10-09",
        genre: "Romance",
        duration: 45,
        country: "USA",
        language: "None",
        writer: "Alexander Black",
        production_company: "Alexander Black Photoplays",
        description: "The adventures of a female reporter in the 1890s.",
        budget: "10000",
        usa_gross_income: nil,
        worlwide_gross_income: nil,
        metascore: nil
      })
  end

  def insert_principal(imdb_title_id, imdb_name_id) do
    Repo.insert(%Principal{
      imdb_title_id: imdb_title_id,
      ordering: 2,
      imdb_name_id: imdb_name_id,
      category: "actress",
      job: nil,
      characters: "[\"Mr. Hamilton\"]"
    })
  end

  def insert_rating(imdb_title_id) do
    Repo.insert(%Rating{
      imdb_title_id: imdb_title_id,
      mean_vote: 5.9,
      median_vote: 6.0,
      total_votes: 154,
      weighted_average_vote: 5.9,
    })
  end

  def insert_rating2(imdb_title_id, rating) do
    Repo.insert(%Rating{
      imdb_title_id: imdb_title_id,
      mean_vote: rating,
      median_vote: 6.0,
      total_votes: 154,
      weighted_average_vote: 5.9,
    })
  end

  def insert_name() do
    Repo.insert(%Name{
      imdb_name_id: "nm0000002",
      name: "Lauren Bacall",
      birth_name: "Betty Joan Perske",
      height: "174",
      bio: "Lauren Bacall was born Betty Joan Perske on September 16, 1924, in New York City",
      birth_details: "September 16, 1924 in The Bronx, New York City, New York, USA",
      date_of_birth: "1924-09-16",
      place_of_birth: "The Bronx, New York City, New York, USA",
      death_details: "August 12, 2014 in New York City, New York, USA (stroke)",
      date_of_death: "2014-08-12",
      place_of_death: "New York City, New York, USA ",
      reason_of_death: "stroke",
      spouses_string: "",
      spouses: "2",
      divorces: "1",
      spouses_with_children: "2",
      children: "3",
    })
  end

end
