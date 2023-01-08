defmodule FFT.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :name, :string
      add :location, :string
      add :items, :string
      add :zip, :integer
      add :lat, :decimal
      add :lng, :decimal

      timestamps()
    end
  end
end
