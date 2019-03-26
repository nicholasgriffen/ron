defmodule Ron.Repo do
  use Ecto.Repo,
    otp_app: :ron,
    adapter: Ecto.Adapters.Postgres
end
