defmodule PhxBlogWeb.ArticleController do
  use PhxBlogWeb, :controller

  alias PhxBlog.Articles
  alias PhxBlog.Articles.Article

  def index(conn, _params) do
    articles = Articles.list_articles()
    render(conn, "index.html", articles: articles)
  end

  #
  # def show(conn, %{"id" => id}) do
  #   article = Articles.get_article!(id)
  #   render(conn, "show.html", article: article)
  # end
  #
  # def edit(conn, %{"id" => id}) do
  #   article = Articles.get_article!(id)
  #   changeset = Articles.change_article(article)
  #   render(conn, "edit.html", article: article, changeset: changeset)
  # end
  #
  # def update(conn, %{"id" => id, "article" => article_params}) do
  #   article = Articles.get_article!(id)
  #
  #   case Articles.update_article(article, article_params) do
  #     {:ok, article} ->
  #       conn
  #       |> put_flash(:info, "Article updated successfully.")
  #       |> redirect(to: article_path(conn, :show, article))
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", article: article, changeset: changeset)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   article = Articles.get_article!(id)
  #   {:ok, _article} = Articles.delete_article(article)
  #
  #   conn
  #   |> put_flash(:info, "Article deleted successfully.")
  #   |> redirect(to: article_path(conn, :index))
  # end
end
