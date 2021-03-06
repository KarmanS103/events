defmodule EventsWeb.EvntControllerTest do
  use EventsWeb.ConnCase

  alias Events.Evnts

  @create_attrs %{date: "some date", description: "some description", name: "some name"}
  @update_attrs %{date: "some updated date", description: "some updated description", name: "some updated name"}
  @invalid_attrs %{date: nil, description: nil, name: nil}

  def fixture(:evnt) do
    {:ok, evnt} = Evnts.create_evnt(@create_attrs)
    evnt
  end

  describe "index" do
    test "lists all evnts", %{conn: conn} do
      conn = get(conn, Routes.evnt_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Evnts"
    end
  end

  describe "new evnt" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.evnt_path(conn, :new))
      assert html_response(conn, 200) =~ "New Evnt"
    end
  end

  describe "create evnt" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.evnt_path(conn, :create), evnt: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.evnt_path(conn, :show, id)

      conn = get(conn, Routes.evnt_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Evnt"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.evnt_path(conn, :create), evnt: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Evnt"
    end
  end

  describe "edit evnt" do
    setup [:create_evnt]

    test "renders form for editing chosen evnt", %{conn: conn, evnt: evnt} do
      conn = get(conn, Routes.evnt_path(conn, :edit, evnt))
      assert html_response(conn, 200) =~ "Edit Evnt"
    end
  end

  describe "update evnt" do
    setup [:create_evnt]

    test "redirects when data is valid", %{conn: conn, evnt: evnt} do
      conn = put(conn, Routes.evnt_path(conn, :update, evnt), evnt: @update_attrs)
      assert redirected_to(conn) == Routes.evnt_path(conn, :show, evnt)

      conn = get(conn, Routes.evnt_path(conn, :show, evnt))
      assert html_response(conn, 200) =~ "some updated date"
    end

    test "renders errors when data is invalid", %{conn: conn, evnt: evnt} do
      conn = put(conn, Routes.evnt_path(conn, :update, evnt), evnt: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Evnt"
    end
  end

  describe "delete evnt" do
    setup [:create_evnt]

    test "deletes chosen evnt", %{conn: conn, evnt: evnt} do
      conn = delete(conn, Routes.evnt_path(conn, :delete, evnt))
      assert redirected_to(conn) == Routes.evnt_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.evnt_path(conn, :show, evnt))
      end
    end
  end

  defp create_evnt(_) do
    evnt = fixture(:evnt)
    %{evnt: evnt}
  end
end
