# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :infinity_one_app,
  ecto_repos: [InfinityOneApp.Repo]

# Configures the endpoint
config :infinity_one_app, InfinityOneAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2LBRBLwN149Kr1mrG4SzWkm4tiGl8VpkGnUwFpj1ibw+ozVxW39rftKeEpfQlNly",
  render_errors: [view: InfinityOneAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InfinityOneApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
