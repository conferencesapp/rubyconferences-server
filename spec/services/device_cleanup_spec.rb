require "rails_helper"

describe DeviceCleanup do
  describe "run" do
    it "will delete devices which are unregistered" do
      tokens = [
        "123",
        "456"
      ]
      allow(client).to receive(:devices).and_return(tokens)
      tokens.each do |token|
        create(:device, token: token)
      end
      cleanup = DeviceCleanup.new(client)

      cleanup.run

      expect(Device.count).to eq(0)
    end

    it "will not delete registered devices" do
      allow(client).to receive(:devices).and_return([])
      create(:device)
      cleanup = DeviceCleanup.new(client)

      cleanup.run

      expect(Device.count).to eq(1)
    end

    def client
      @client ||= double("HoustonClient")
      allow(@client).to receive(:gateway_uri=)
      allow(@client).to receive(:feedback_uri=)

      @client
    end
  end
end
