defmodule FFT.Filters do
  @doc """
  Prepares the filter for use.

  ## Examples

      iex> prepare(" Foo ")
      "foo"

  """
  def prepare(filter) when is_binary(filter) do
    filter
    |> String.trim()
    |> String.downcase()
  end
end
