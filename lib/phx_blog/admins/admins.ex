defmodule PhxBlog.Admins do
  import Ecto.Query, warn: false
  alias PhxBlog.Repo
  alias PhxBlog.Admins.Admin

  def get_admin(id), do: Repo.get(Admin, id)

  def login_admin(%Admin{} = admin) do
    Admin.changeset(admin, %{})
  end

  def create_or_update_admin(attrs) do
    case Repo.get_by(Admin, email: attrs[:email]) do
      nil ->
        %Admin{}
        |> Admin.changeset(attrs)
        |> Repo.insert()
      admin ->
        admin
        |> Admin.changeset(attrs)
        |> Repo.update()
    end
  end
end
