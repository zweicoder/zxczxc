defmodule Goslash.Repo do
  use Ecto.Repo,
    otp_app: :goslash,
    adapter: Ecto.Adapters.Postgres
end
