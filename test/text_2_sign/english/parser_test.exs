defmodule Text2Sign.English.ParserTest do
  use ExUnit.Case

  alias Text2Sign.English.Fetcher
  alias Text2Sign.English.Parser

  setup do
    {:ok, page} = Fetcher.fetch("YAM")
    {:ok, page: page}
  end

  test ".parse function", %{page: page} do
    assert "https://www.signingsavvy.com/signs/mp4/9/9055.mp4" = Parser.parse(page)
  end
end
