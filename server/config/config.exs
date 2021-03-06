# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ron,
  ecto_repos: [Ron.Repo]

# Configures the endpoint
config :ron, RonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4MGx8AfxfKPgHipxoqboOFdGTROweDvst2Alg+RvG7jHv5g/4tkhhg5aD3wV7jmp",
  render_errors: [view: RonWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Ron.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
