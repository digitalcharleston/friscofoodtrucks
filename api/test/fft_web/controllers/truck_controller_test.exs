defmodule FFTWeb.TruckControllerTest do
  use FFTWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trucks with no filter", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :index, filter: ""))

      assert json_response(conn, 200)["data"] == [
               %{
                 "id" => 43,
                 "items" => "philly cheese steaks",
                 "lat" => "37.784331703246846",
                 "lng" => "-122.38581205302317",
                 "location" => "Independence Street",
                 "name" => "Philly Street Meet"
               },
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

    test "lists filtered trucks with a filter", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :index, filter: "pizza"))

      assert json_response(conn, 200)["data"] == [
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
