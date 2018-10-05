defmodule PhxBlogWeb.Admin.ArticleController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Articles

  plug :put_layout, "admin.html"

  def index(conn, _params) do
    conn
    |> render("index.html", articles: Articles.list_articles())
  end
end
