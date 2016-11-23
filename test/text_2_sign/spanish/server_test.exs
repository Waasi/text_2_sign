defmodule Text2Sign.Spanish.ServerTest do
  use ExUnit.Case

  alias Text2Sign.Spanish.Server

  setup_all do
    {:ok, :timer.sleep(5000)}
  end

  test "Spanish Server returns a data for a given valid word" do
    assert {:ok, _data} = Server.translation("HOLA")
  end

  test "Spanish Server returns error msg for an invalid word" do
    assert {:error, "invalid word wakhbdkj"} = Server.translation("wakhbdkj")
  end
end
