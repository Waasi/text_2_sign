defmodule Text2Sign.TranslatorTest do
  use ExUnit.Case

  alias Text2Sign.Translator

  test ".translate a single word in english" do
    assert Translator.translate(["YAM"], "english") == ["https://www.signingsavvy.com/signs/mp4/9/9055.mp4"]
  end


  test ".translate an empty list of words in english" do
    [""] = Translator.translate(["WAKAKAA"], "english")
  end
end
