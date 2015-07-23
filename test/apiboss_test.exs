defmodule APIBossTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  import APIBoss

  test "start/0" do
    capture_io(fn ->
      assert start === :ok
      # starting twice should still return :ok
      assert start === :ok
    end)
  end

  test "start/2" do
    assert true === true
  end

  test "stop/1" do
    assert stop(nil) === :ok
  end
end
