defmodule RonWeb.Router do
  use RonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RonWeb do
    pipe_through :api
    get "/quote", QuoteController, :getQuote
  end

end
