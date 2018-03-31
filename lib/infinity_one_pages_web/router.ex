defmodule InfinityOnePagesWeb.Router do
  use InfinityOnePagesWeb, :router

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

  scope "/", InfinityOnePagesWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/apps/:id", AppsController, :show
    get "/apps", AppsController, :index
    get "/features", FeaturesController, :index
    get "/why", WhyController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", InfinityOnePagesWeb do
  #   pipe_through :api
  # end
end
