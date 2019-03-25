defmodule RonWeb.QuoteController do
  use RonWeb, :controller

  def getOne(conn, params) do
    size = params[:size] || "large"
    {:ok, quote} = findQuote(size)

    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, quote)
  end

  def vote(conn, params) do
    # if quote blacklist includes conn.remote_ip
    # expects
  end

  defp findQuote(_size) do
    # dets set
    # get all the quotes
    # send them to front end
    # persist a quote if it is voted on
    # persist an average rating
    # key, quote, size, rating, blacklist
    {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} = :httpc.request(:get, {'http://ron-swanson-quotes.herokuapp.com/v2/quotes', []}, [], [])
    [quote] = Jason.decode!(body)
    {:ok, quote}
  end
end
