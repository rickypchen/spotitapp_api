# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :spotitapp,
  namespace: SpotitApp,
  ecto_repos: [SpotitApp.Repo]

# Configures the endpoint
config :spotitapp, SpotitApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DgWfQR6u9hqFeO/v1Vi16qlJWn1I73RqcI7zu3g70kGTWrcCi/Ply6PRfawIXN8o",
  render_errors: [view: SpotitApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SpotitApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Ueberauth
config :ueberauth, Ueberauth,
  providers: [
    identity: {
      Ueberauth.Strategy.Identity,
      [callback_methods: ["POST"]]
    }
  ]

# Configures Guaridan
config :guardian, Guardian,
  issuer: "SpotitApp",
  ttl: {30, :days},
  secret_key: "PjlcZNRtHWQobYDx57A3yYwfwaFx3+T8KIPo454pwmxkVln5KEyQb6GIqnj6UBHs",
  serializer: SpotitApp.GuardianSerializer,
  permissions: %{default: [:read, :write]}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
