defmodule FFT.Services.FoodTruckData do
  use GenServer

  alias FFT.Services.FoodTruckData.{Fetcher, Parser}

  @hours 24

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def list() do
    GenServer.call(__MODULE__, :get_trucks)
  end

  # Server

  @impl true
  def init(trucks) do
    do_initial_fetch()

    {:ok, trucks}
  end

  @impl true
  def handle_info(:fetch, _) do
    trucks = fetch_trucks()

    schedule_next_fetch()

    {:noreply, trucks}
  end

  @impl true
  def handle_call(:get_trucks, _from, trucks) do
    {:reply, trucks, trucks}
  end

  defp fetch_trucks() do
    Fetcher.fetch()
    |> Parser.parse()
  end

  defp do_initial_fetch() do
    Process.send(self(), :fetch, [])
  end

  defp schedule_next_fetch() do
    Process.send_after(self(), :fetch, @hours * 60 * 60 * 1000)
  end
end
