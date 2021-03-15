defmodule FdcEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :fdc_ex,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "fdc-ex",
      source_url: "https://github.com/j0/fdc-ex",
      deps: deps()
    ]
  end

  defp description() do
    "This is a elixir client library for Food Data Central, built with the intention of supporting a Nutrition Calculator."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "postgrestex",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*  LICENSE*
                 ),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/j0/fdc-ex"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.7"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
