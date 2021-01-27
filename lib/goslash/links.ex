defmodule Goslash.Links do
  import Ecto.Query, warn: false

  alias Goslash.Repo
  alias Goslash.Link

  def get_link(%{path: path}) do
    Repo.one(from l in Link, where: l.path == ^path)
  end

  def create_link(attrs) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end
end
