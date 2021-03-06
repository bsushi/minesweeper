# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
import Config

# Configures the endpoint
config :minesweeper, MinesweeperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rPzWv2QgEYbJqGPLHt49VElM6bwvngSZwUqKjOoN5jPumEGoGMGYkd+Jxp3K58/K",
  render_errors: [view: MinesweeperWeb.ErrorView, accepts: ~w(html json)],
  live_view: [signing_salt: "MdMOc8XMH6Xdtt/LIw0fRsL64ZSAWB06fZhLWNPuqS80n17+gY2SRaS4qamCDNnr"],
  pubsub_server: Minesweeper.PubSub

config :phoenix, :json_library, Poison

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
