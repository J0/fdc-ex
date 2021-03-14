defmodule FdcExTest do
  use ExUnit.Case
  doctest FdcEx

  test "greets the world" do
    {status, _} = FdcEx.get_spec()
    assert status == :ok
  end
end
