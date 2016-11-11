defmodule Fetcher do
  @moduledoc """
  The Text2Sign.Fetcher module implements
  a behaviour that allows the fetching of
  the url for the translation video page
  of a given word. This behaviour will be
  used to implement fetchers for multiple
  languages.

  ### Functions:
      - fetch/1
  """

  ######
  # Callbacks
  ######

  @doc """
  The fetch/1 function takes a string type
  word as an argument and returns a tuple
  with the status and the url for the given
  word. This function must be implemented
  by any module addopting the Fetcher behaviour.
  """

  @callback fetch(String.t) :: String.t
end
