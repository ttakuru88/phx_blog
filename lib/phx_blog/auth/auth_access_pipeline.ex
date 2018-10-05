defmodule PhxBlog.Auth.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :phx_blog

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
