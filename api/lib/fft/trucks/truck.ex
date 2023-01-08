defmodule FFT.Trucks.Truck do
  defstruct [:id, :name, :location, :items, :lat, :lng]

  def new(attrs) do
    %__MODULE__{
      id: attrs.id,
      name: attrs.name,
      location: attrs.location,
      items: attrs.items,
      lat: attrs.lat,
      lng: attrs.lng
    }
  end
end
