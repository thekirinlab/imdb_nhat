defmodule ImdbWeb.Movie.SearchTest do
  use ImdbWeb.ConnCase, async: true

  setup do
    {:ok, movie} = insert_movie("1", "Test_title")
    insert_rating(movie.imdb_title_id)
    {:ok, movie: movie}
  end

  test "search", %{conn: conn} do
    conn =
      get(
        conn,
        Routes.movie_path(conn, :index, %{
          "search_text" => "Test",
          "sort_type" => "",
          "order" => "",
          "page" => 1
        })
      )

    if Enum.count(conn.assigns.movies) > 0 do
      IO.inspect("Here we go")
      title = Enum.at(conn.assigns.movies, 0)
      |> IO.inspect()
      |> Map.get(:title)

      assert title == "Test_title"
    end
  end
end
