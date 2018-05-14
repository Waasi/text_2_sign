defmodule Text2Sign.Fetcher do
  @moduledoc """
  The Text2Sign.Fetcher module allows the fetching
  of the url for the given word.
  """

  @doc """
  The fetch/1 function takes a string type
  word as an argument and returns a tuple
  with the status and the url for the given
  word.

  ### Example:
      iex> Text2Sign.Fetcher.fetch("Word")\n
      {:ok, some_url}
  """

  def fetch(word, url) do
    response = HTTPoison.get!("#{url}search/#{word}")

    endpoint =
      response.body
      |> Floki.find("a[href*=#{String.upcase(word)}]")
      |> Floki.attribute("href")
      |> Enum.at(0)

    {:ok, endpoint}
  end
end
