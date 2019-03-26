defmodule RonWeb.QuotesController do
  use RonWeb, :controller

  alias Ron.Quotes
  def find(conn, params) do
    size = params["size"] || "large"

    quotes = cond do
      size === "large" ->
        Quotes.get_large_quote()
      size === "medium" ->
        Quotes.get_medium_quote()
      size === "small" ->
        Quotes.get_small_quote()
    end

    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(random_quote(quotes)))
  end

  def vote(conn, params) do
    # if quote blacklist includes conn.remote_ip
    # expects
  end

  defp random_quote(quotes) do
    rand_quote = Enum.at(quotes, Enum.random(0..(length(quotes) - 1)))
    %{text: rand_quote.text, blacklist: rand_quote.blacklist, rating: rand_quote.rating, id: rand_quote.id}
  end

end
