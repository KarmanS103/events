defmodule EventsWeb.EvntController do
  use EventsWeb, :controller

  alias Events.Evnts
  alias Events.Evnts.Evnt

  def index(conn, _params) do
    evnts = Evnts.list_evnts()
    render(conn, "index.html", evnts: evnts)
  end

  def new(conn, _params) do
    changeset = Evnts.change_evnt(%Evnt{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"evnt" => evnt_params}) do
    case Evnts.create_evnt(evnt_params) do
      {:ok, evnt} ->
        conn
        |> put_flash(:info, "Evnt created successfully.")
        |> redirect(to: Routes.evnt_path(conn, :show, evnt))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    evnt = Evnts.get_evnt!(id)
    render(conn, "show.html", evnt: evnt)
  end

  def edit(conn, %{"id" => id}) do
    evnt = Evnts.get_evnt!(id)
    changeset = Evnts.change_evnt(evnt)
    render(conn, "edit.html", evnt: evnt, changeset: changeset)
  end

  def update(conn, %{"id" => id, "evnt" => evnt_params}) do
    evnt = Evnts.get_evnt!(id)

    case Evnts.update_evnt(evnt, evnt_params) do
      {:ok, evnt} ->
        conn
        |> put_flash(:info, "Evnt updated successfully.")
        |> redirect(to: Routes.evnt_path(conn, :show, evnt))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", evnt: evnt, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    evnt = Evnts.get_evnt!(id)
    {:ok, _evnt} = Evnts.delete_evnt(evnt)

    conn
    |> put_flash(:info, "Evnt deleted successfully.")
    |> redirect(to: Routes.evnt_path(conn, :index))
  end
end
