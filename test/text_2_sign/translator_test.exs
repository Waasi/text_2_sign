defmodule Text2Sign.TranslatorTest do
  use ExUnit.Case

  @url "https://www.signingsavvy.com/"

  alias Text2Sign.{Translator, Fetcher}

  import Mock

  test ".translate a single word" do
    with_mock Fetcher, fetch: fn _word, _url -> {:ok, "sign/YAM/8544/1"} end do
      assert Translator.translate(["YAM"]) == ["#{@url}signs/mp4/9/9055.mp4"]
    end
  end

  test ".translate an empty list of words" do
    with_mock Fetcher, fetch: fn _word, _url -> {:ok, ""} end do
      Translator.translate(["WAKAKAA"]) == []
    end
  end
end
