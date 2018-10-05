defmodule PhxBlogWeb.Admin.SessionController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Admins
  alias PhxBlog.Admins.Admin

  def new(conn, _params) do
    conn
    |> render("new.html", changeset: Admins.login_admin(%Admin{}))
  end

  def create(conn, %{"admin" => %{"email" => email, "password" => password}}) do
    conn
    |> render("new.html", changeset: Admins.login_admin(%Admin{email: email}))
  end
end
