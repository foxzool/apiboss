defmodule APIBoss.ConfigTest do
  use ExUnit.Case, async: true
  import APIBoss.Config

  test "config one" do
    expected_list = [true, {:http,  [port: 4000]},
                           {:https, [certfile: "",
                                     keyfile: "",
                                     port: 4443]}]
    assert get(:router) === nil
    assert get(:for_test) === expected_list
  end
end
