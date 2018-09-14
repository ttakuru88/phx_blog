defmodule PhxBlogWeb.Router do
  use PhxBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxBlogWeb do
    pipe_through :browser # Use the default browser stack

    resources "/", ArticleController
  end

  scope "/admin", PhxBlogWeb.Admin, as: :admin do
    pipe_through :browser

    resources "/articles", ArticleController, only: [:index]
  end
end
