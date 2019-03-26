defmodule Ron.Repo.Migrations.UpdateQuoteTable do
  use Ecto.Migration

  def change do
    alter table(:quotes) do
      add :length, :integer
    end
  end
end
