defmodule GoslashWeb.LinkResolverController do
  @moduledoc """
  LinkActionController handles all logic related to resolving a link. Currently the only supported action is redirecting.
  """
  use GoslashWeb, :controller
  alias Goslash.Links

  def handle_resolve(conn, _params) do
    path = conn.path_info |> Enum.join("/")
    IO.puts("Resolving path: #{path}")

    link = Links.get_link(%{path: path})

    case link do
      nil ->
        IO.puts("#{path} not found in DB. Redirecting user to create link...")

        conn
        |> redirect(to: Routes.link_path(conn, :index, path: path))

      _ ->
        ### TODO handle recursive links / too many redirects
        conn
        |> redirect(external: link.dest)
    end
  end
end
