defmodule Text2Sign.Spanish.Fetcher do
  @moduledoc """
  The Text2Sign.Spanish.Fetcher
  module implements adopts the Fetcher behaviour
  to enable the fetching the translation video
  page of a given word in Spanish.
  """

  @behaviour Fetcher

  alias Text2Sign.Spanish.Server

  def fetch(word) do
    input = word |> String.upcase
    {:ok, Server.translation(input)}
  end
end
