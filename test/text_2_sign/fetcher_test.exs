defmodule Text2Sign.FetcherTest do
  use ExUnit.Case

  alias Text2Sign.Fetcher

  test ".fetch function" do
    assert {:ok, "sign/YAM/8544/1"} = Fetcher.fetch("YAM")
  end
end

