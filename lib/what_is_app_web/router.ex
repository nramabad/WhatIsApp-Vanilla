defmodule WhatIsAppWeb.Router do
  use WhatIsAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug WhatIsApp.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Maybe logged in scope
  scope "/", WhatIsAppWeb do
    pipe_through [:browser, :auth]
    get "/", PageController, :index
    post "/", PageController, :login
    post "/logout", PageController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", WhatIsAppWeb do
  #   pipe_through :api
  # end

  # Definitely logged in scope
  scope "/", WhatIsAppWeb do
    pipe_through [:browser, :auth, :ensure_auth]
    get "/secret", PageController, :secret
  end
end
