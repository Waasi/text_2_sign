defmodule Text2Sign.Mixfile do
  use Mix.Project

  def project do
    [
      app: :text_2_sign,
      version: "0.1.1",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.9.0"}, {:floki, "~> 0.11.0"}, {:mock, "~> 0.2.0", only: :test}]
  end
end
