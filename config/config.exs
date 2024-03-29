# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :what_is_app,
  ecto_repos: [WhatIsApp.Repo]

# Configures the endpoint
config :what_is_app, WhatIsAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BEf77Up3NvI/fNt5WgF4cNeIFaKtFlF4x/m0wAd0ar/luSg5ui/XoKG/LQWLolwm",
  render_errors: [view: WhatIsAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WhatIsApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :what_is_app, WhatIsApp.Auth.Guardian,
  issuer: "what_is_app", # Name of your app/company/product
  secret_key: "" # Replace this with the output of the mix command

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
