defmodule FFT.TrucksFixtures do
  @moduledoc """
  This module defines test helpers for creating trucks.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    attrs
    |> Enum.into(%{
      id: 42,
      items: "some items",
      lat: "120.5",
      lng: "120.5",
      location: "some location",
      name: "some name"
    })
    |> FFT.Trucks.Truck.new()
  end
end
