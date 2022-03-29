defmodule ImdbWeb.MovieController do
  use ImdbWeb, :controller

  alias Imdb.Movie

  def index(conn, params) do
    IO.inspect("Movie controller")
    movies = Movie.list_movies(params)
    %{"search_text" => search_text, "sort_type" => sort_type, "order" => order, "page" => page} = params
    render(conn, "index.html",
      movies: movies.entries,
      search_text: search_text,
      sort_type: sort_type,
      page: page,
      order: order,
      page_number: movies.page_number,
      page_size: movies.page_size,
      total_pages: movies.total_pages,
      total_entries: movies.total_entries
    )
  end

  def show(conn, %{"id" => id}) do
    movie =
      Movie.get_movie(id)
      |> IO.inspect()
    IO.inspect("assigns")
    IO.inspect(conn.assigns)
    render(conn, "movie_info.html", movie: movie)
  end

  # def top(conn, _params) do
  #   IO.inspect("Movie controller")
  #   movies = Movie.get_top_movies()
  #   # movies = Movie.get_all_movies()
  #   render(conn, "index.html", movies: movies)
  # end

  # def top_sort(conn, %{"sort_type" => sort_type}) do
  #   movies =
  #     Movie.get_movies_sort_by_param(sort_type)
  #     |> IO.inspect()

  #   render(conn, "index.html", movies: movies)
  # end

  # def search(conn, %{"search_text" => search_text}) do
  #   movies =
  #     Movie.search_movies(search_text)
  #     |> IO.inspect()

  #   render(conn, "index.html", movies: movies)
  # end

  # def search_and_sort(conn, %{"search_text" => search_text, "sort_type" => sort_type}) do
  #   IO.inspect("Search and sort")

  #   movies =
  #     Movie.get_movies_sort_and_search(search_text, sort_type)
  #     |> IO.inspect()

  #   render(conn, "index.html", movies: movies)
  # end
end
