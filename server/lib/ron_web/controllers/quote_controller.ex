defmodule RonWeb.QuoteController do
  use RonWeb, :controller

  def getQuote(conn, %{"size" => size} \\ "large") do
    {:ok, quote} = findQuote(size)

    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, quote)
  end

  defp findQuote(size) do
    {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body} =
      :httpc.request(:get, {'http://ron-swanson-quotes.herokuapp.com/v2/quotes', []}, [], [])
    [quote] = Jason.decode!(body)
    {:ok, quote}
  end
end
