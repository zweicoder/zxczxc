defmodule Goslash.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :path, :string
    field :dest, :string

    timestamps()
  end

  @doc false
  def changeset(link, attrs \\ %{}) do
    link
    |> cast(attrs, [:path, :dest])
    |> validate_required([:path, :dest])
    |> unique_constraint(:path, name: :links_path_index)
  end
end
