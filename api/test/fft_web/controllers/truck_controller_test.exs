defmodule FFTWeb.TruckControllerTest do
  use FFTWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trucks", %{conn: conn} do
      conn = get(conn, Routes.truck_path(conn, :index))

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
