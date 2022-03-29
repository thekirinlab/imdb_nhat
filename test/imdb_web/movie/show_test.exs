defmodule ImdbWeb.Movie.ShowTest do
  use ImdbWeb.ConnCase, async: true

  setup do
    {:ok, movie} = insert_movie("1", "Test_title")
    |> IO.inspect()
    insert_rating(movie.imdb_title_id)
    IO.inspect("movie id")
    IO.inspect(movie.imdb_title_id)
    {:ok, movie: movie}
  end

  test "Show movie", %{conn: conn, movie: movie} do
    conn = get(conn, Routes.movie_path(conn, :show, movie.id))
    IO.inspect("assigns")
    IO.inspect(conn.assigns.movie)
    assert movie.imdb_title_id == conn.assigns.movie.imdb_title_id
  end
end
