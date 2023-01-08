defmodule FFT.Trucks do
  alias FFT.Services.FoodTruckData

  @doc """
  Returns the trucks.

  ## Examples

      iex> list("")
      [%Truck{}, ...]

      iex> list("pizza")
      [%Truck{}, ...]

  """
  def list(filter, data_store \\ FoodTruckData) do
    data_store.list(filter)
  end
end
