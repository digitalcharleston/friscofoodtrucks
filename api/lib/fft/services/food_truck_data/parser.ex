NimbleCSV.define(MyParser, separator: ",", escape: "\"")

defmodule FFT.Services.FoodTruckData.Parser do
  alias FFT.Trucks.Truck

  def parse(csv_string) do
    csv_string
    |> split_to_list()
    |> convert_to_map_of_approved_trucks_with_attrs_we_care_about()
  end

  defp split_to_list(csv_string), do: MyParser.parse_string(csv_string)

  defp convert_to_map_of_approved_trucks_with_attrs_we_care_about(list) do
    Enum.reduce(list, [], &convert/2)
  end

  defp convert(
         [
           location_id,
           applicant,
           "Truck",
           _cnn,
           location_description,
           _address,
           _blocklot,
           _block,
           _lot,
           _permit,
           "APPROVED",
           food_items,
           _x,
           _y,
           latitude,
           longitude,
           _schedule,
           _days_hours,
           _noi_sent,
           _approved,
           _received,
           _prior_permit,
           _expiration_date,
           _location,
           _fire_prevention_districts,
           _police_districts,
           _supervisor_districts,
           _zip_codes,
           _neighborhoods
         ],
         acc
       )
       when food_items != "" and location_description != "" do
    [
      %Truck{
        id: String.to_integer(location_id),
        name: applicant,
        location: location_description,
        items: food_items,
        lat: latitude,
        lng: longitude
      }
      | acc
    ]
  end

  defp convert(_, acc), do: acc
end
