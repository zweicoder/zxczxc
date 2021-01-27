defmodule Goslash.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :path, :string, null: false

      timestamps()
    end
  end
end
