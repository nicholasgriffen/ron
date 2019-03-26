defmodule Ron.Quotes.Quote do
  use Ecto.Schema
  import Ecto.Changeset
  @derive Jason.Encoder
  schema "quotes" do
    field :blacklist, {:array, :string}
    field :rating, :float
    field :text, :string
    field :length, :integer

    timestamps()
  end

  @doc false
  def changeset(quote, attrs) do
    quote
    |> cast(attrs, [:text, :rating, :blacklist, :length])
    |> validate_required([:text, :rating, :blacklist, :length])
  end
end
