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

  pipeline :auth do
    plug PhxBlog.Auth.AuthAccessPipeline
  end

  scope "/admin", PhxBlogWeb.Admin, as: :admin do
    pipe_through [:browser, :auth]

    get "/", ArticleController, :index, as: :root
    delete "/logout", SessionController, :delete, as: :logout
  end

  scope "/admin", PhxBlogWeb.Admin, as: :admin do
    pipe_through :browser

    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end

  scope "/", PhxBlogWeb do
    pipe_through :browser

    resources "/", ArticleController, only: [:index]
  end
end
