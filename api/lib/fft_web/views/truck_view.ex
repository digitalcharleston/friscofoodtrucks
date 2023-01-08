defmodule FFTWeb.TruckView do
  use FFTWeb, :view
  alias FFTWeb.TruckView

  def render("index.json", %{trucks: trucks}) do
    %{data: render_many(trucks, TruckView, "truck.json")}
  end

  def render("truck.json", %{truck: truck}) do
    %{
      id: truck.id,
      name: truck.name,
      location: truck.location,
      items: truck.items,
      lat: truck.lat,
      lng: truck.lng
    }
  end
end
