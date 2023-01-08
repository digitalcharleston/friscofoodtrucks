defmodule FFTWeb.Router do
  use FFTWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FFTWeb do
    pipe_through :api

    resources "/trucks", TruckController, only: [:index]
  end
end
