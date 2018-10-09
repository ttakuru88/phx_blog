defmodule PhxBlog.Auth.EnsureAuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :phx_blog

  plug Guardian.Plug.EnsureAuthenticated
end
