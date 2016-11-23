defmodule Text2Sign.TranslatorTest do
  use ExUnit.Case

  alias Text2Sign.Translator

  setup_all do
    {:ok, :timer.sleep(5000)}
  end

  test ".translate a single word in english" do
    assert Translator.translate(["YAM"], "english") == ["https://www.signingsavvy.com/signs/mp4/9/9055.mp4"]
  end


  test ".translate an empty list of words in english" do
    [""] = Translator.translate(["WAKAKAA"], "english")
  end

  test ".translate a single word in spanish" do
    assert Translator.translate(["NOCHE"], "spanish") == ["http://diccionariodesenas.umce.cl/files/VIDEOS/n/NOCHE.flv"]
  end


  test ".translate an empty list of words in spanish" do
    [""] = Translator.translate(["WAKAKAA"], "spanish")
  end
end
