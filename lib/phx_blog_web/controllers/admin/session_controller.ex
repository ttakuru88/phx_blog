defmodule PhxBlogWeb.Admin.SessionController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Admins
  alias PhxBlog.Admins.Admin

  def new(conn, _params) do
    conn
    |> render("new.html", changeset: Admins.login_admin(%Admin{}))
  end

  def create(conn, %{"admin" => %{"email" => email, "password" => password}}) do
    case PhxBlog.Auth.authenticate_admin(email, password) do
      {:ok, admin} ->
        conn
        |> PhxBlog.Auth.login(admin)
        |> put_flash(:info, "ログインしたぞ")
        |> redirect(to: admin_article_path(conn, :index))
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> render("new.html", changeset: Admins.login_admin(%Admin{email: email}))
    end
  end

  def delete(conn, _) do
    conn
    |> PhxBlog.Auth.logout()
    |> put_flash(:info, "ログアウトしたぞ")
    |> redirect(to: admin_login_path(conn, :new))
  end
end
