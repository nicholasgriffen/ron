# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ron.Repo.insert!(%Ron.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} = :httpc.request(:get, {'http://ron-swanson-quotes.herokuapp.com/v2/quotes/57', []}, [], [])
{:ok, quotes} = Jason.decode(body)
Enum.each(quotes, fn q -> Ron.Quotes.create_quote(%{text: q, blacklist: [], rating: 0.0, length: length(String.split(q, " "))}) end)
