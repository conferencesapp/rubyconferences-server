class DeviceCleanup
  def initialize(client = APN_CLIENT)
    @client = client
  end

  def run
    Device.where(token: device_tokens).destroy_all
  end

  private

  attr_reader :client

  def device_tokens
    client.devices
  end
end
