defmodule Text2Sign.Translator do
  import Rosetta

  languages [:english, :spanish]

  @moduledoc """
  The Text2Sign.Translator module allows the fetching
  of the video url for a given list of words.

  ### Functions:
      - translate/2
  """

  ######
  # Public API
  ######

  @doc """
  The translate/2 function takes a list of
  string type words as argument and a string
  type value for the language to be used. It
  returns a list with the video urls for the 
  given list of words.

  ### Example:
      iex> Text2Sign.Translator.translate(["Word", "World"], "english")\n
      ["some_url", "other_url"]
  """

  def translate([], _language), do: {:ok, []}
  def translate(words, language) do
    words
    |> Enum.map(fn word -> distribute(word, language) end)
    |> Enum.map(&collect/1)
  end

  ######
  # Private API
  ######

  defp distribute(word, language) do
    method = :"from_#{language}"

    Task.async(fn ->
      apply(__MODULE__, method, [word])
    end)
  end

  defp collect(pid) do
    Task.await(pid)
  end
end
