defmodule Ron.QuotesTest do
  use Ron.DataCase

  alias Ron.Quotes

  describe "quotes" do
    alias Ron.Quotes.Quote

    @valid_attrs %{blacklist: [], rating: 120.5, text: "some text"}
    @update_attrs %{blacklist: [], rating: 456.7, text: "some updated text"}
    @invalid_attrs %{blacklist: nil, rating: nil, text: nil}

    def quote_fixture(attrs \\ %{}) do
      {:ok, quote} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Quotes.create_quote()

      quote
    end

    test "list_quotes/0 returns all quotes" do
      quote = quote_fixture()
      assert Quotes.list_quotes() == [quote]
    end

    test "get_quote!/1 returns the quote with given id" do
      quote = quote_fixture()
      assert Quotes.get_quote!(quote.id) == quote
    end

    test "create_quote/1 with valid data creates a quote" do
      assert {:ok, %Quote{} = quote} = Quotes.create_quote(@valid_attrs)
      assert quote.blacklist == []
      assert quote.rating == 120.5
      assert quote.text == "some text"
    end

    test "create_quote/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quotes.create_quote(@invalid_attrs)
    end

    test "update_quote/2 with valid data updates the quote" do
      quote = quote_fixture()
      assert {:ok, %Quote{} = quote} = Quotes.update_quote(quote, @update_attrs)
      assert quote.blacklist == []
      assert quote.rating == 456.7
      assert quote.text == "some updated text"
    end

    test "update_quote/2 with invalid data returns error changeset" do
      quote = quote_fixture()
      assert {:error, %Ecto.Changeset{}} = Quotes.update_quote(quote, @invalid_attrs)
      assert quote == Quotes.get_quote!(quote.id)
    end

    test "delete_quote/1 deletes the quote" do
      quote = quote_fixture()
      assert {:ok, %Quote{}} = Quotes.delete_quote(quote)
      assert_raise Ecto.NoResultsError, fn -> Quotes.get_quote!(quote.id) end
    end

    test "change_quote/1 returns a quote changeset" do
      quote = quote_fixture()
      assert %Ecto.Changeset{} = Quotes.change_quote(quote)
    end
  end
end
