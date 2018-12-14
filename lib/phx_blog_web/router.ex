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

  pipeline :login_session do
    plug PhxBlog.Auth.LoginSessionPipeline
  end

  pipeline :ensure_auth do
    plug PhxBlog.Auth.EnsureAuthPipeline
  end

  pipeline :ensure_not_auth do
    plug PhxBlog.Auth.EnsureNotAuthPipeline
  end

  scope "/admin", PhxBlogWeb.Admin, as: :admin do
    pipe_through [:browser, :login_session, :ensure_auth]

    get "/", ArticleController, :index, as: :root
    resources "/articles", ArticleController, only: [:index, :new, :create]
    delete "/logout", SessionController, :delete, as: :logout
  end

  scope "/admin", PhxBlogWeb.Admin, as: :admin do
    pipe_through [:browser, :login_session, :ensure_not_auth]

    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end

  scope "/", PhxBlogWeb do
    pipe_through [:browser, :login_session]

    resources "/", ArticleController, only: [:index]
  end
end
