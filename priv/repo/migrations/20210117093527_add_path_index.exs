defmodule Goslash.Repo.Migrations.AddPathIndex do
  use Ecto.Migration

  def change do
    create index(:links, [:path], comment: "Index on Path", unique: true)
  end
end
