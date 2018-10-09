defmodule PhxBlog.Auth.EnsureNotAuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :phx_blog

  plug Guardian.Plug.EnsureNotAuthenticated
end
