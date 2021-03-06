defmodule PhxBlog.Auth.Guardian do
  use Guardian, otp_app: :phx_blog

  alias PhxBlog.Admins

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    admin = Admins.get_admin(id)
    {:ok, admin}
  end
end
