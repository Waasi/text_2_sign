defmodule Text2Sign.Utils do
  @moduledoc false
  @url "https://www.signingsavvy.com/"

  alias Text2Sign.Fetcher

  def extract_response({:ok, {_word, response}}), do: response
  def extract_response(response), do: response

  def translate_word(""), do: {:ok, nil}

  def translate_word(word) do
    case Fetcher.fetch(word, @url) do
      {:ok, url} ->
        endpoint =
          url
          |> fetch_script()
          |> parse_script()

        {word, "#{@url}#{endpoint}"}

      _ ->
        []
    end
  end

  def parse_script([]), do: []

  def parse_script(script) do
    script
    |> Floki.DeepText.get()
    |> String.split("player1VideoList=new Array(")
    |> Enum.at(1)
    |> String.split("\"")
    |> Enum.at(1)
  end

  def fetch_script(url) do
    %{body: body} = HTTPoison.get!("https://www.signingsavvy.com/#{url}")
    Floki.find(body, ".signing_body script")
  end
end
