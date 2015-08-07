CarrierWave.configure do |config|
  config.asset_host = ENV.fetch("ASSET_HOST", ENV.fetch("HOST"))
end
