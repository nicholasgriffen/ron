defmodule Ron.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :text, :string
      add :rating, :float
      add :blacklist, {:array, :string}

      timestamps()
    end

  end
end
