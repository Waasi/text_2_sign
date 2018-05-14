defmodule Text2Sign.Translator do
  @moduledoc """
  The Text2Sign.Translator module allows the fetching
  of the video url for a given list of words.
  """

  alias Text2Sign.Utils

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
    |> Task.async_stream(&Utils.translate_word/1)
    |> Stream.map(&Utils.extract_response/1)
    |> Enum.to_list()
  end
end
