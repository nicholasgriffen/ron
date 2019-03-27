defmodule RonWeb.QuotesController do
  use RonWeb, :controller

  alias Ron.Quotes

  def home(conn, _params) do
    redirect(conn, to: "/index.html")
  end

  def find(conn, params) do
    size = params["size"] || "large"

    quotes =
      cond do
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

  def vote(conn, %{"id" => id}) do
    {intId, _remainder} = Integer.parse(id)
    quote = Quotes.get_quote!(intId)
    ip = to_string(:inet_parse.ntoa(conn.remote_ip))
    # if quote blacklist includes conn.remote_ip reject
    if Enum.member?(quote.blacklist, ip) do
      conn
      |> send_resp(401, "You've already voted on this quote")
    else
      # add ip to blacklist
      newBlacklist = [ip] ++ quote.blacklist
      # add rating to rating
      # divide rating by blacklist length
      {rating, _remainder} = Integer.parse(conn.body_params["rating"])
      newRating = (rating + quote.rating) / 2
      # update record
      Quotes.update_quote(quote, %{"rating" => newRating, "blacklist" => newBlacklist})
      # send rating
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(newRating))
    end
  end

  defp random_quote(quotes) do
    rand_quote = Enum.at(quotes, Enum.random(0..(length(quotes) - 1)))

    %{
      text: rand_quote.text,
      blacklist: rand_quote.blacklist,
      rating: rand_quote.rating,
      id: rand_quote.id
    }
  end
end
