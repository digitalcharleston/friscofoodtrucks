defmodule FFT.TrucksTest do
  use FFT.DataCase

  alias FFT.Trucks

  describe "trucks" do
    import FFT.TrucksFixtures

    test "list/2 returns all trucks with no filter" do
      truck = truck_fixture()
      truck2 = truck_fixture(%{id: 43, name: "some other name"})

      defmodule MockFoodTruckData do
        def list(_filter),
          do: [truck_fixture(), truck_fixture(%{id: 43, name: "some other name"})]
      end

      assert Trucks.list("", MockFoodTruckData) == [truck, truck2]
    end

    test "list/2 returns filtered trucks with a filter" do
      truck = truck_fixture()

      defmodule MockFoodTruckDataFiltered do
        def list(_filter), do: [truck_fixture()]
      end

      assert Trucks.list("pizza", MockFoodTruckDataFiltered) == [truck]
    end
  end
end
