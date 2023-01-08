defmodule FFTWeb.Router do
  use FFTWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FFTWeb do
    pipe_through :api

    post "/trucks", TruckController, :index
    options "/trucks", TruckController, :index
  end
end
