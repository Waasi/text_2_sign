defmodule Text2Sign.Fetcher do
  @moduledoc """
  The Text2Sign.Fetcher module allows the fetching
  of the url for the given word.

  ### Functions:
      - fetch/1
  """

  ######
  # Public API
  ######

  @doc """
  The fetch/1 function takes a string type
  word as an argument and returns a tuple
  with the status and the url for the given
  word.

  ### Example:
      iex> Text2Sign.Fetcher.fetch("Word")\n
      {:ok, some_url}
  """

  def fetch(word) do
    response = HTTPoison.get! "https://www.signingsavvy.com/search/#{word}"

    url = response.body
      |> Floki.find("a[href*=#{String.upcase(word)}]")
      |> Floki.attribute("href")

    {:ok, Enum.at(url, 0)}
  end
end
