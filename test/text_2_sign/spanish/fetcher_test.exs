defmodule Text2Sign.Spanish.FetcherTest do
  use ExUnit.Case

  alias Text2Sign.Spanish.Fetcher

  setup_all do
    {:ok, :timer.sleep(5000)}
  end

  test ".fetch function" do
    assert {:ok, _data} = Fetcher.fetch("HOLA")
  end
end

