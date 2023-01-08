defmodule FFT.FiltersTest do
  use FFT.DataCase

  alias FFT.Filters

  describe "filters" do
    test "prepare/0 only accepts a string" do
      assert_raise FunctionClauseError, fn ->
        assert Filters.prepare(42) == "xyzzy"
      end
    end

    test "prepare/0 returns a string in all lowercase" do
      assert Filters.prepare("XyZZy") == "xyzzy"
    end

    test "prepare/0 returns a string without leading whitespace" do
      assert Filters.prepare("   xyzzy") == "xyzzy"
    end

    test "prepare/0 returns a string without trailing whitespace" do
      assert Filters.prepare("xyzzy   ") == "xyzzy"
    end

    test "prepare/0 returns a string without leading or trailing whitespace" do
      assert Filters.prepare("   xyzzy   ") == "xyzzy"
    end

    test "prepare/0 returns a string in all lowercase without leading or trailing whitespace" do
      assert Filters.prepare("   XyZZy   ") == "xyzzy"
    end

    test "prepare/0 returns a prepared string as is" do
      assert Filters.prepare("xyzzy") == "xyzzy"
    end
  end
end
