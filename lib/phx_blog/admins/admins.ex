defmodule PhxBlog.Admins do
  import Ecto.Query, warn: false
  alias PhxBlog.Repo
  alias PhxBlog.Admins.Admin

  def get_admin(id), do: Repo.get(Admin, id)
end
