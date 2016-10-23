defmodule Text2Sign.Translator do
  @moduledoc """
  The Text2Sign.Translator module allows the fetching
  of the video url for a given list of words.

  ### Functions:
      - translate/1
  """

  alias Text2Sign.Fetcher

  ######
  # Public API
  ######

  @doc """
  The translate/1 function takes a list of
  string type words as argument and returns
  a list with the video urls for the given
  list of words.

  ### Example:
      iex> Text2Sign.Translator.translate(["Word", "World"])\n
      ["some_url", "other_url"]
  """

  def translate([]), do: {:ok, []}
  def translate(words) do
    words
    |> Enum.map(&distribute/1)
    |> Enum.map(&collect/1)
  end

  ######
  # Private API
  ######

  defp translate_word(""), do: {:ok, nil}
  defp translate_word(word) do
    case Fetcher.fetch(word) do
      {:ok, url} ->
        {word, fetch_script(url) |> parse_script}
      _ ->
        []
    end
  end

  defp parse_script([]), do: []
  defp parse_script(script) do
    script
    |> Floki.DeepText.get
    |> String.split("player1VideoList=new Array(")
    |> Enum.at(1)
    |> String.split("\"")
    |> Enum.at(1)
  end

  defp fetch_script(url) do
    response = HTTPoison.get! "https://www.signingsavvy.com/#{url}"
    response.body |> Floki.find(".signing_body script")
  end

  defp distribute(word) do
    Task.async(fn -> translate_word(word) end)
  end

  defp collect(pid) do
    Task.await(pid)
  end
end
