defmodule Imdb.Repo do
  use Ecto.Repo,
    otp_app: :imdb,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 10
  # use Phoenix.Pagination, per_page: 10
end
