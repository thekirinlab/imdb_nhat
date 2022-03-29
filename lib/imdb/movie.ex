defmodule Imdb.Movie do
  @moduledoc """
  The Movie context.
  """
  import Ecto.Query, warn: false
  alias Imdb.Repo

  alias Imdb.Movie.Movie
  alias Imdb.Movie.Rating

  def get_movie(id) do
    query =
      from m in Movie,
        join: r in Rating,
        on: m.imdb_title_id == r.imdb_title_id,
        where: m.id == ^"#{id}"

    query =
      from [m, r] in query,
        select: %{
          id: m.id,
          imdb_title_id: m.imdb_title_id,
          title: m.title,
          original_title: m.original_title,
          year: m.year,
          duration: m.duration,
          genre: m.genre,
          description: m.description,
          writer: m.writer,
          total_votes: r.total_votes,
          mean_vote: r.mean_vote
        }

    query
    |> Repo.one()
  end

  def list_movies(%{"search_text" => search_text, "sort_type" => sort_type, "order" => order, "page" => page}) do
    IO.inspect("page: ")
    IO.inspect(page)
    # page = String.to_integer(page)
    query =
      from m in Movie,
        join: r in Rating,
        on: m.imdb_title_id == r.imdb_title_id
        # offset: ^"#{page}" * 10,
        # limit: 10

    query = from [m, r] in query, where: like(m.title, ^"%#{search_text}%")

    query =
      case sort_type do
        "Total votes" ->
          if order == "Desc" do
            from [m, r] in query,
              order_by: [desc: r.total_votes]
          else
            from [m, r] in query,
              order_by: [asc: r.total_votes]
          end

        "Published year" ->
          if order == "Desc" do
            from [m, r] in query,
              order_by: [desc: m.year]
          else
            from [m, r] in query,
              order_by: [asc: m.year]
          end

        "Rating" ->
          if order == "Desc" do
            from [m, r] in query,
              order_by: [desc: r.mean_vote]
          else
            from [m, r] in query,
              order_by: [asc: r.mean_vote]
          end

        _ ->
          if order == "Desc" do
            from [m, r] in query,
              order_by: [desc: r.mean_vote]
          else
            from [m, r] in query,
              order_by: [asc: r.mean_vote]
          end
      end

    query =
      from [m, r] in query,
        select: %{id: m.id, title: m.title, year: m.year, mean_vote: r.mean_vote}

    query
    # |> Repo.all()
    |> Repo.paginate(page: page, page_size: 10)
  end
end

 # def filter_by_genres(genres) do
  #   query =
  #     from m in Movie,
  #       join: r in Rating,
  #       on: m.imdb_title_id == r.imdb_title_id,
  #       where: m.genre in ^"#{genres}"

  #   query =
  #     from [m, r] in query,
  #       select: %{
  #         id: m.id,
  #         title: m.title,
  #         original_title: m.original_title,
  #         year: m.year,
  #         duration: m.duration,
  #         genre: m.genre,
  #         description: m.description,
  #         writer: m.writer,
  #         total_votes: r.total_votes,
  #         mean_vote: r.mean_vote
  #       }

  #   query
  #   |> Repo.all()
  # end

    # def get_all_movies() do
  #   Repo.all(Movie)
  # end

  # def get_top_movies() do
  #   IO.inspect("Movie service")

  #   query =
  #     from m in Movie,
  #       join: r in Rating,
  #       on: m.imdb_title_id == r.imdb_title_id,
  #       order_by: [desc: r.mean_vote],
  #       limit: 20

  #   query =
  #     from [m, r] in query,
  #       select: %{id: m.id, title: m.title, year: m.year, mean_vote: r.mean_vote}

  #   query
  #   |> Repo.all()
  # end

  # def get_movies_sort_by_param(sort_type) do
  #   IO.inspect("sort type")
  #   IO.inspect(sort_type)

  #   query =
  #     from m in Movie,
  #       join: r in Rating,
  #       on: m.imdb_title_id == r.imdb_title_id,
  #       limit: 20

  #   query =
  #     case sort_type do
  #       "number_rating" ->
  #         from [m, r] in query,
  #           order_by: [desc: r.total_votes]

  #       "publish_year" ->
  #         from [m, r] in query,
  #           order_by: [desc: m.year]

  #       "rating" ->
  #         from [m, r] in query,
  #           order_by: [desc: r.mean_vote]

  #       _ ->
  #         from [m, r] in query,
  #           order_by: [desc: r.mean_vote]
  #     end

  #   query =
  #     from [m, r] in query,
  #       select: %{id: m.id, title: m.title, year: m.year, mean_vote: r.mean_vote}

  #   query
  #   |> Repo.all()
  # end

  # def search_movies(search_text) do
  #   IO.inspect("search text")
  #   IO.inspect(search_text)

  #   query =
  #     from m in Movie,
  #       join: r in Rating,
  #       on: m.imdb_title_id == r.imdb_title_id,
  #       limit: 20

  #   query = from [m, r] in query, where: like(m.title, ^"%#{search_text}%")

  #   query =
  #     from [m, r] in query,
  #       select: %{id: m.id, title: m.title, year: m.year, mean_vote: r.mean_vote}

  #   query
  #   |> Repo.all()
  # end

  # def get_movies_sort_and_search(search_text, sort_type) do
  #   query =
  #     from m in Movie,
  #       join: r in Rating,
  #       on: m.imdb_title_id == r.imdb_title_id,
  #       limit: 20

  #   query = from [m, r] in query, where: like(m.title, ^"%#{search_text}%")

  #   query =
  #     case sort_type do
  #       "number_rating" ->
  #         from [m, r] in query,
  #           order_by: [desc: r.total_votes]

  #       "publish_year" ->
  #         from [m, r] in query,
  #           order_by: [desc: m.year]

  #       "rating" ->
  #         from [m, r] in query,
  #           order_by: [desc: r.mean_vote]

  #       _ ->
  #         from [m, r] in query,
  #           order_by: [desc: r.mean_vote]
  #     end

  #   query =
  #     from [m, r] in query,
  #       select: %{id: m.id, title: m.title, year: m.year, mean_vote: r.mean_vote}

  #   query
  #   |> Repo.all()
  # end
