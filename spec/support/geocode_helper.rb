Geocoder.configure(lookup: :test)

Geocoder::Lookup::Test.add_stub(
  "New York, NY", [
    {
      "latitude"     => 40.7143528,
      "longitude"    => -74.0059731,
      "address"      => "New York, NY, USA",
      "state"        => "New York",
      "state_code"   => "NY",
      "country"      => "United States",
      "country_code" => "US"
    }
  ]
)
