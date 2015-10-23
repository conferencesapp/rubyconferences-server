require "rails_helper"

describe DeviceCleanup do
  describe "#run" do
    it "will import feedback from Rpush" do
      allow(Rpush).to receive(:apns_feedback)

      DeviceCleanup.run

      expect(Rpush).to have_received(:apns_feedback)
    end

    it "will delete devices from feedback table" do
      device = create(:device)
      another_device = create(:device)
      Rpush::Apns::Feedback.create!(
        device_token: device.token,
        failed_at: Time.zone.now
      )

      DeviceCleanup.run

      expect(Device.count).to eq(1)
      expect(Device.last).to eq(another_device)
    end
  end
end
