defmodule HelloElixir.App do
  use Application
  def start(_type, _args) do
    IO.puts "Starting cowboy at http://localhost:4000"
    children = [
      {Plug.Cowboy, scheme: :http, plug: HelloElixir, port: 4000}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
