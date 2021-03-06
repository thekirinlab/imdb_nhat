defmodule CSV.Mixfile do
  use Mix.Project

  def project do
    [
        app: :csv,
        version: "1.2.4",
        elixir: "~> 1.1",
        deps: deps,
        package: package,
        docs: &docs/0,
        name: "CSV",
        consolidate_protocols: true,
        source_url: "https://github.com/beatrichartz/csv",
        description: "CSV Decoding and Encoding for Elixir"
    ]
  end

  defp package do
    [
        maintainers: ["Beat Richartz"],
        licenses: ["MIT"],
        links: %{github: "https://github.com/beatrichartz/csv" }
    ]
  end

  defp deps do
    [
      {:benchfella, only: :bench},
      {:ex_csv, only: :bench},
      {:csvlixir, only: :bench},
      {:cesso, only: :bench},
      {:ex_doc, "0.9.0", only: :docs},
      {:inch_ex, only: :docs},
      {:earmark, "0.1.19", only: :docs}
    ]
  end

  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])

    [
        source_ref: ref,
        main: "overview"
    ]
  end
end
