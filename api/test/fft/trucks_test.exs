defmodule FFT.TrucksTest do
  use FFT.DataCase

  alias FFT.Trucks

  describe "trucks" do
    import FFT.TrucksFixtures

    test "list/0 returns all trucks" do
      truck = truck_fixture()

      defmodule FoodTruckData do
        def list, do: [truck_fixture()]
      end

      assert Trucks.list(FoodTruckData) == [truck]
    end
  end
end
