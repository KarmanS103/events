defmodule Events.EvntsTest do
  use Events.DataCase

  alias Events.Evnts

  describe "evnts" do
    alias Events.Evnts.Evnt

    @valid_attrs %{date: "some date", description: "some description", name: "some name"}
    @update_attrs %{date: "some updated date", description: "some updated description", name: "some updated name"}
    @invalid_attrs %{date: nil, description: nil, name: nil}

    def evnt_fixture(attrs \\ %{}) do
      {:ok, evnt} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Evnts.create_evnt()

      evnt
    end

    test "list_evnts/0 returns all evnts" do
      evnt = evnt_fixture()
      assert Evnts.list_evnts() == [evnt]
    end

    test "get_evnt!/1 returns the evnt with given id" do
      evnt = evnt_fixture()
      assert Evnts.get_evnt!(evnt.id) == evnt
    end

    test "create_evnt/1 with valid data creates a evnt" do
      assert {:ok, %Evnt{} = evnt} = Evnts.create_evnt(@valid_attrs)
      assert evnt.date == "some date"
      assert evnt.description == "some description"
      assert evnt.name == "some name"
    end

    test "create_evnt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Evnts.create_evnt(@invalid_attrs)
    end

    test "update_evnt/2 with valid data updates the evnt" do
      evnt = evnt_fixture()
      assert {:ok, %Evnt{} = evnt} = Evnts.update_evnt(evnt, @update_attrs)
      assert evnt.date == "some updated date"
      assert evnt.description == "some updated description"
      assert evnt.name == "some updated name"
    end

    test "update_evnt/2 with invalid data returns error changeset" do
      evnt = evnt_fixture()
      assert {:error, %Ecto.Changeset{}} = Evnts.update_evnt(evnt, @invalid_attrs)
      assert evnt == Evnts.get_evnt!(evnt.id)
    end

    test "delete_evnt/1 deletes the evnt" do
      evnt = evnt_fixture()
      assert {:ok, %Evnt{}} = Evnts.delete_evnt(evnt)
      assert_raise Ecto.NoResultsError, fn -> Evnts.get_evnt!(evnt.id) end
    end

    test "change_evnt/1 returns a evnt changeset" do
      evnt = evnt_fixture()
      assert %Ecto.Changeset{} = Evnts.change_evnt(evnt)
    end
  end
end
