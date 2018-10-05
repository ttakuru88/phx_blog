defmodule PhxBlogWeb.Router do
  use PhxBlogWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxBlogWeb do
    pipe_through [:browser]

    resources "/", ArticleController
  end

  scope "/admin", PhxBlogWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_session]

    resources "/articles", ArticleController, only: [:index]
    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end
end
