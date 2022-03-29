defmodule ImdbWeb.Movie.PagingTest do
  use ImdbWeb.ConnCase, async: true

  setup do
    {:ok, movie} = insert_movie("1", "Test_title")

    Enum.each(2..11, fn x ->
      {:ok, movie} = insert_movie(Integer.to_string(x), "Test_title")
      insert_rating(movie.imdb_title_id)
    end)

    {:ok, movie: movie}
  end

  test "paging", %{conn: conn} do
    conn1 =
      get(
        conn,
        Routes.movie_path(conn, :index, %{
          "search_text" => "",
          "sort_type" => "Rating",
          "order" => "Desc",
          "page" => 1
        })
      )

    assert Enum.count(conn1.assigns.movies) == 10

    conn2 =
      get(
        conn,
        Routes.movie_path(conn, :index, %{
          "search_text" => "",
          "sort_type" => "Rating",
          "order" => "Desc",
          "page" => 2
        })
      )

    assert Enum.count(conn2.assigns.movies) == 10
  end
end
