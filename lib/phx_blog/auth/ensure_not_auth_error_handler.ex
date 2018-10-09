defmodule PhxBlog.Auth.EnsureNotAuthErrorHandler do
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import PhxBlogWeb.Router.Helpers, only: [admin_root_path: 2]

  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_flash(:error, to_string(type))
    |> redirect(to: admin_root_path(conn, :index))
  end
end
