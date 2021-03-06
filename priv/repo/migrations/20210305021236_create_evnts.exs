defmodule Events.Repo.Migrations.CreateEvnts do
  use Ecto.Migration

  def change do
    create table(:evnts) do
      add :name, :text, null: false
      add :date, :text, null: false
      add :description, :text, null: false

      timestamps()
    end

  end
end
