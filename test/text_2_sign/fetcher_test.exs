defmodule Text2Sign.FetcherTest do
  use ExUnit.Case

  @url "https://www.signingsavvy.com/"

  alias Text2Sign.Fetcher

  test "fetch/2 fetches the words endpoints" do
    assert {:ok, "sign/YAM/8544/1"} = Fetcher.fetch("YAM", @url)
  end
end
