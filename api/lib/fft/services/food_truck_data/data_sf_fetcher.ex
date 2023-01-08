defmodule FFT.Services.FoodTruckData.DataSFFetcher do
  alias FFT.Services.FoodTruckData.FetcherBehaviour

  @behaviour FetcherBehaviour

  @impl FetcherBehaviour
  def fetch() do
    {:ok, %Finch.Response{body: body}} =
      Finch.build(
        :get,
        "https://data.sfgov.org/api/views/rqzj-sfat/rows.csv?accessType=DOWNLOAD",
        []
      )
      |> Finch.request(MyFinch)

    body
  end
end
