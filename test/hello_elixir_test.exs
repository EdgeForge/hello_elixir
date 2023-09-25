defmodule HelloElixirTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts HelloElixir.init([])

  test "it returns Hello World" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = HelloElixir.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello World!"
  end

  test "it returns Not Found" do
    # Create a test connection
    conn = conn(:get, "/anything")

    # Invoke the plug
    conn = HelloElixir.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Not Found"
  end
end
