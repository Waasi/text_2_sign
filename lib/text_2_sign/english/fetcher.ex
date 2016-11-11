defmodule Text2Sign.English.Fetcher do
  @moduledoc """
  The Text2Sign.English.Fetcher module implements
  adopts the Fetcher behaviour to enable the fetching
  the translation video page of a given word in English.
  """

  @behaviour Fetcher

  def fetch(word) do
    search_response = HTTPoison.get! "https://www.signingsavvy.com/search/#{word}"

    url = search_response.body
      |> Floki.find("a[href*=#{String.upcase(word)}]")
      |> Floki.attribute("href")
      |> Enum.at(0)

    response = HTTPoison.get! "https://www.signingsavvy.com/#{url}"
    {:ok, response.body}
  end
end
