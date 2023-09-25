import Config

port = if config_env() == :test do
  4001
else
  String.to_integer(System.get_env("PORT") || "4000")
end

config :hello_elixir, HelloElixir,
  port: port
