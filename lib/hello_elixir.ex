defmodule HelloElixir do
  @moduledoc """
  A Plug responsible for logging request info,
  matching routes, and dispatching responses.
  """
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello World!")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
