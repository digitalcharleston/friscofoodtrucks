defmodule FFTWeb.TruckController do
  use FFTWeb, :controller

  alias FFT.Trucks

  def index(conn, _params) do
    trucks = Trucks.list()

    render(conn, "index.json", trucks: trucks)
  end
end
