defmodule ImdbWeb.Movie.SortTest do
  use ImdbWeb.ConnCase, async: true

    @rating1 8.5
    @rating2 9.0

    setup do
      {:ok, movie1} = insert_movie("1", "Test_title1")
      {:ok, movie2} = insert_movie("2", "Test_title2")
      insert_rating2(movie1.imdb_title_id, @rating1)
      insert_rating2(movie2.imdb_title_id, @rating2)
      {:ok, movie1: movie1, movie2: movie2}
    end

    test "Sort desc", %{conn: conn} do
      conn = get(conn, Routes.movie_path(conn, :index, %{
        "search_text" => "",
        "sort_type" => "Rating",
        "order" => "Desc",
        "page" => 1
      }))
      title1 = Enum.at(conn.assigns.movies, 0)
      |> Map.get(:title)
      assert title1 == "Test_title2"
    end

    test "Sort asc", %{conn: conn} do
      conn = get(conn, Routes.movie_path(conn, :index, %{
        "search_text" => "",
        "sort_type" => "Rating",
        "order" => "Asc",
        "page" => 1
      }))
      title1 = Enum.at(conn.assigns.movies, 0)
      |> Map.get(:title)
      assert title1 == "Test_title1"
    end
end
