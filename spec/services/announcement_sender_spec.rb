require "rails_helper"

describe AnnouncementSender do
  describe "run" do
    it "will send push notifications for given device token" do
      announcement = create(:announcement)
      device_token = "device-token"
      notification = double("Notification")
      allow(Houston::Notification).to receive(:new).and_return(notification)
      sender = AnnouncementSender.new(announcement, device_token, client)

      sender.run

      expect(Houston::Notification).
        to have_received(:new).with(
          token: device_token,
          alert: announcement.body
      )
      expect(client).to have_received(:push).with(notification)
    end

    def client
      @client ||= double("HoustonClient")
      allow(@client).to receive(:gateway_uri=)
      allow(@client).to receive(:feedback_uri=)
      allow(@client).to receive(:push)

      @client
    end
  end
end
