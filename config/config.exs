# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phx_blog,
  ecto_repos: [PhxBlog.Repo]

# Configures the endpoint
config :phx_blog, PhxBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KYDoFpCfPqwpcpVjBHac+/LsCL7znJkPbJSGSVElP5pfPPTYGBQynMxYoF+2HQwY",
  render_errors: [view: PhxBlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxBlog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phx_blog, PhxBlog.Auth.LoginSessionPipeline,
  module: PhxBlog.Auth.Guardian

config :phx_blog, PhxBlog.Auth.EnsureAuthPipeline,
  module: PhxBlog.Auth.Guardian,
  error_handler: PhxBlog.Auth.EnsureAuthErrorHandler

config :phx_blog, PhxBlog.Auth.EnsureNotAuthPipeline,
  module: PhxBlog.Auth.Guardian,
  error_handler: PhxBlog.Auth.EnsureNotAuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
