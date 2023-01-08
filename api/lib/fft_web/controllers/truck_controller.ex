defmodule FFTWeb.TruckController do
  use FFTWeb, :controller

  alias FFT.Filters
  alias FFT.Trucks

  def index(conn, %{"filter" => filter}) do
    trucks =
      filter
      |> Filters.prepare()
      |> Trucks.list()

    render(conn, "index.json", trucks: trucks)
  end
end
