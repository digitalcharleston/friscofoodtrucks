defmodule FFT.Services.FoodTruckData.Fetcher do
  def fetch(), do: fetcher().fetch()

  defp fetcher,
    do: Application.get_env(:fft, :trucks_fetcher, FFT.Services.FoodTruckData.DataSFFetcher)
end
