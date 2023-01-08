defmodule FFT.Trucks do
  alias FFT.Services.FoodTruckData

  @doc """
  Returns the trucks.

  ## Examples

      iex> list()
      [%Truck{}, ...]

  """
  def list(data_store \\ FoodTruckData) do
    data_store.list()
  end
end
