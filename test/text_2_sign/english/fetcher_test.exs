defmodule Text2Sign.English.FetcherTest do
  use ExUnit.Case

  alias Text2Sign.English.Fetcher

  test ".fetch function" do
    assert {:ok, _body} = Fetcher.fetch("YAM")
  end
end

