defmodule FftWeb.Router do
  use FftWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FftWeb do
    pipe_through :api
  end
end
