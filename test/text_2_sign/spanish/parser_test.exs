defmodule Text2Sign.Spanish.ParserTest do
  use ExUnit.Case

  alias Text2Sign.Spanish.Fetcher
  alias Text2Sign.Spanish.Parser

  setup do
    :timer.sleep(5000)

    {:ok, data} = Fetcher.fetch("NOCHE")
    {:ok, data: data}
  end

  test ".parse function", %{data: data} do
    assert "http://diccionariodesenas.umce.cl/files/VIDEOS/n/NOCHE.flv" = Parser.parse(data)
  end
end
