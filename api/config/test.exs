import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fft, FFTWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "eAA7we+7QidAXcTHjd9l5HrFYVc69vm/8/LdnFN95OVMCiqzwu3r8Aq7pRg5sMKY",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

defmodule FFT.MockTruckFetcher do
  def fetch() do
    "locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)\n42,Tasty Truck,Truck,,Market Street,,,,,,APPROVED,hot dogs pizza,,,37.794331003246846,-122.39581105302317,,,,,,,,,,,,,\n43,Philly Street Meet,Truck,,Independence Street,,,,,,APPROVED,philly cheese steaks,,,37.784331703246846,-122.38581205302317,,,,,,,,,,,,,"
  end
end

config :fft, :trucks_fetcher, FFT.MockTruckFetcher
