defmodule Events.Evnts do
  @moduledoc """
  The Evnts context.
  """

  import Ecto.Query, warn: false
  alias Events.Repo

  alias Events.Evnts.Evnt

  @doc """
  Returns the list of evnts.

  ## Examples

      iex> list_evnts()
      [%Evnt{}, ...]

  """
  def list_evnts do
    Repo.all(Evnt)
  end

  @doc """
  Gets a single evnt.

  Raises `Ecto.NoResultsError` if the Evnt does not exist.

  ## Examples

      iex> get_evnt!(123)
      %Evnt{}

      iex> get_evnt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_evnt!(id), do: Repo.get!(Evnt, id)

  @doc """
  Creates a evnt.

  ## Examples

      iex> create_evnt(%{field: value})
      {:ok, %Evnt{}}

      iex> create_evnt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_evnt(attrs \\ %{}) do
    %Evnt{}
    |> Evnt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a evnt.

  ## Examples

      iex> update_evnt(evnt, %{field: new_value})
      {:ok, %Evnt{}}

      iex> update_evnt(evnt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_evnt(%Evnt{} = evnt, attrs) do
    evnt
    |> Evnt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a evnt.

  ## Examples

      iex> delete_evnt(evnt)
      {:ok, %Evnt{}}

      iex> delete_evnt(evnt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_evnt(%Evnt{} = evnt) do
    Repo.delete(evnt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking evnt changes.

  ## Examples

      iex> change_evnt(evnt)
      %Ecto.Changeset{data: %Evnt{}}

  """
  def change_evnt(%Evnt{} = evnt, attrs \\ %{}) do
    Evnt.changeset(evnt, attrs)
  end
end
