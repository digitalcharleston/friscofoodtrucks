defmodule FFT.Services.FoodTruckData.ParserTest do
  use FFT.DataCase

  alias FFT.Services.FoodTruckData.Parser

  describe "parse" do
    test "parses a CSV of truck data" do
      csv_string =
        "locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)\n42,Tasty Truck,Truck,,Market Street,,,,,,APPROVED,hot dogs pizza,,,37.794331003246846,-122.39581105302317,,,,,,,,,,,,,"

      assert Parser.parse(csv_string), [
        %{
          "id" => 42,
          "items" => "hot dogs pizza",
          "lat" => "37.794331003246846",
          "lng" => "-122.39581105302317",
          "location" => "Market Street",
          "name" => "Tasty Truck"
        }
      ]
    end
  end
end
