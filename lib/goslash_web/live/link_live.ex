defmodule GoslashWeb.LinkLive do
  require Logger
  use GoslashWeb, :live_view
  use Phoenix.HTML

  import GoslashWeb.ErrorHelpers

  alias Goslash.Link
  alias Goslash.Links

  @impl true
  def mount(params, _session, socket) do
    {:ok, assign(socket, changeset: Link.changeset(%Link{path: params["path"]}))}
  end

  @impl true
  def handle_event("validate", %{"link" => link_params}, socket) do
    Logger.debug("Validate link: #{inspect(link_params)}")

    changeset =
      %Link{}
      |> Link.changeset(link_params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset, redirect_to: "testtest")}
  end

  @impl true
  def handle_event("save", %{"link" => link_params}, socket) do
    Logger.info("Saving link: #{inspect(link_params)}")

    case Links.create_link(link_params) do
      {:ok, link} ->
        {:noreply,
         socket
         |> clear_flash()
         |> put_flash(:info, "Link created, redirecting... ")
         |> redirect(external: resolve_url(link))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply,
         socket |> put_flash(:error, "Error creating link!") |> assign(changeset: changeset)}
    end
  end

  # Append http if dest doesn't have a scheme, otherwise it defaults to the same host
  defp resolve_url(%Link{dest: dest}) do
    cond do
      String.match?(dest, ~r|https?://|) -> dest
      true -> "http://#{dest}"
    end
  end
end
