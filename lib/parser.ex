defmodule Parser do
  @moduledoc """
  The Text2Sign.Parser module implements
  a behaviour that allows the parsing of
  the fetched page of the video for the
  translation of a given word.

  This behaviour will be used to implement
  parsers for multiple languages.

  ### Functions:
      - parse/1
  """

  ######
  # Callbacks
  ######

  @doc """
  The parse/1 function takes a string type
  html page as an argument and returns a
  tuple with the status and the url for the
  video translation of the given word. This
  function must be implemented by any module
  addopting the Parser behaviour.
  """

  @callback parse(String.t) :: String.t
end
