defmodule SimpleTemplateWeb.Router do
  use SimpleTemplateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SimpleTemplateWeb do
    pipe_through :api
  end

  # scope "/", HelloWeb do
  #   get "/", PageController, :index
  # end
end
