defmodule Text2Sign.Spanish.Parser do
  @behaviour Parser

  @moduledoc """
  The Text2Sign.Spanish.Parser module implements
  adopts the Parser behaviour to enable the parsing
  the translation video page of a given word in Spanish.
  """

  def parse({:error, _error}), do: ""
  def parse({:ok, data}) do
    video = data["Region"] |> Enum.at(0)
    "http://diccionariodesenas.umce.cl/files/#{video["Video"]["file"]}"
  end
end
