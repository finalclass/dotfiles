defmodule CleanDb.MixProject do
  use Mix.Project

  def project do
    [
      app: :clean_db,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end
  
  def escript_config do
    [
      main_module: CleanDb.CLI
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
      {:httpoison, "~> 1.5"},
      {:poison, "~> 4.0"},
    ]
  end
end
