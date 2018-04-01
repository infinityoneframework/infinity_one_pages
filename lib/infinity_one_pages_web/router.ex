defmodule InfinityOnePagesWeb.Router do
  use InfinityOnePagesWeb, :router

  defmacro __using__(_) do
    quote do
      import unquote(__MODULE__), only: [infinity_one_pages_routes: 0]
    end
  end

  defmacro infinity_one_pages_routes do
    quote do
      get "/", PageController, :index
      get "/apps/:id", AppsController, :show
      get "/apps", AppsController, :index
      get "/features", FeaturesController, :index
      get "/why", WhyController, :index
      get "/help", HelpController, :index
      get "/help/:id", HelpController, :show
    end
  end

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
    get "/help", HelpController, :index
    get "/help/:id", HelpController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", InfinityOnePagesWeb do
  #   pipe_through :api
  # end
end
