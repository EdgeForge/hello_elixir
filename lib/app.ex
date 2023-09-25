defmodule HelloElixir.App do
  use Application
  def start(_type, _args) do
    IO.puts "Starting cowboy at http://localhost:#{port()}"
    children = [
      {Plug.Cowboy, scheme: :http, plug: HelloElixir, port: port()}
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  defp port do
    Application.get_env(:hello_elixir, HelloElixir)[:port]
  end
end
