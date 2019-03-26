defmodule RonWeb.Router do
  use RonWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", RonWeb do
    pipe_through(:api)
    get("/quotes", QuotesController, :find)
    post("/quotes", QuotesController, :vote)
  end

  scope "/", RonWeb do
    get("/", QuotesController, :home)
  end
end
