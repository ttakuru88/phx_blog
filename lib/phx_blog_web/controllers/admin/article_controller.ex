defmodule PhxBlogWeb.Admin.ArticleController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Articles

  plug :put_layout, "admin.html"

  import PhxBlog.Auth, only: [load_current_admin: 2]
  plug :load_current_admin when action in [:index]

  def index(conn, _params) do
    conn
    |> render("index.html", articles: Articles.list_articles())
  end
end
