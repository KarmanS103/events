defmodule Events.Evnts.Evnt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "evnts" do
    field :date, :string
    field :description, :string
    field :name, :string
    belongs_to :user, Events.Users.User
    has_many :comments, Events.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(evnt, attrs) do
    evnt
    |> cast(attrs, [:name, :date, :description])
    |> validate_required([:name, :date, :description])
  end
end
