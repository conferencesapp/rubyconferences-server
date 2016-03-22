require "rails_helper"

describe AnnouncementSender do
  describe "run" do
    let(:conference) { create :conference }

    context "when ios app exists" do
      it "will send push notifications for given device token" do
        announcement = create(:conference_announcement)
        Rpush::Apns::App.create!(
          name: "ios_app",
          environment: "sandbox",
          certificate: File.read(
            "spec/support/fixtures/cert_without_password.pem"
          )
        )
        device_token = "4dae0f8c9135ad92\
        de1cdf9ff87daa6f7336b7f07ca8ab0aa1b12b2dd1b20792"
        sender = AnnouncementSender.new(announcement, device_token)

        sender.run

        expect(Rpush::Apns::Notification.count).to eq(1)
      end
    end

    context "when ios app not exists" do
      it "will raise error" do
        announcement = create(:conference_announcement)
        device_token = "4dae0f8c9135ad92\
        de1cdf9ff87daa6f7336b7f07ca8ab0aa1b12b2dd1b20792"
        sender = AnnouncementSender.new(announcement, device_token)

        expect { sender.run }.to raise_error(ActiveRecord::RecordInvalid)
        expect(Rpush::Apns::App.count).to eq(0)
      end
    end
  end
end
