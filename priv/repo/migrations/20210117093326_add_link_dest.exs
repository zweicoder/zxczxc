defmodule Goslash.Repo.Migrations.AddLinkDest do
  use Ecto.Migration

  def change do
    alter table(:links) do
      add :dest, :string, null: false
    end
  end
end
