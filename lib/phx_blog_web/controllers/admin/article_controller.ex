defmodule PhxBlogWeb.Admin.ArticleController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Articles
  alias PhxBlog.Articles.Article

  plug :put_layout, "admin.html"

  import PhxBlog.Auth, only: [load_current_admin: 2]
  plug :load_current_admin

  def index(conn, _params) do
    conn
    |> render("index.html", articles: Articles.list_articles())
  end

  def new(conn, _params) do
    changeset = Articles.change_article(%Article{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"article" => article_params}) do
    case Articles.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "記事を作ったぞ")
        |> redirect(to: admin_article_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
