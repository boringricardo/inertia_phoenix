defmodule InertiaPhoenix.MixProject do
  use Mix.Project

  def project do
    [
      app: :inertia_phoenix,
      version: "0.3.2",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      compilers: [:phoenix] ++ Mix.compilers(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ],
      description: "Inertiajs adapter for Elixir Phoenix",
      package: package()
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
      {:phoenix, "~> 1.6.0"},
      {:phoenix_html, "~> 3.2.0"},
      {:plug, ">= 1.5.0 and < 2.0.0", optional: true},
      {:credo, "~> 1.6.0", only: [:dev, :test]},
      # Credo requires jason to exist also in :dev
      {:jason, "~> 1.4", only: [:dev, :test]},
      {:ex_doc, "~> 0.28.5", only: :dev},
      {:plug_cowboy, "~> 2.5", only: [:test]},
      {:excoveralls, "~> 0.14", only: :test},
      {:doctor, "~> 0.19.0"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Troy Martin"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/devato/inertia_phoenix"},
      files: ~w(lib LICENSE.txt mix.exs README.md)
    ]
  end
end
