defmodule Text2Sign.English.Parser do
  @behaviour Parser

  @moduledoc """
  The Text2Sign.English.Parser module implements
  adopts the Parser behaviour to enable the parsing
  the translation video page of a given word in English.
  """

  def parse(page) do
    case parse_location(page) do
      false -> ""
      location -> "https://www.signingsavvy.com/#{location}"
    end
  end

  defp parse_location(page) do
    page
    |> Floki.find(".signing_body script")
    |> Floki.DeepText.get
    |> String.split("player1VideoList=new Array(")
    |> Enum.at(1, "")
    |> String.split("\"")
    |> Enum.at(1, false)
  end
end
