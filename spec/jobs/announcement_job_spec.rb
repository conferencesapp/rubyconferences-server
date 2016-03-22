require 'rails_helper'

describe AnnouncementJob, type: :job do
  let(:conference) { create :conference }

  it "will create rpush notifications" do
    Rpush::Apns::App.create!(
      name: "ios_app",
      environment: "sandbox",
      certificate: File.read(
        "spec/support/fixtures/cert_without_password.pem"
      )
    )
    devices = create_list(:device, 2)
    announcement = create(:conference_announcement)
    job = AnnouncementJob.new

    job.perform(announcement)

    expect(Rpush::Apns::Notification.count).to eq(2)
    first_notification = Rpush::Apns::Notification.first
    expect(first_notification.device_token).
      to eq(devices.first.token)
    expect(first_notification.alert).
      to eq(announcement.body)
    second_notification = Rpush::Apns::Notification.last
    expect(second_notification.device_token).
      to eq(devices.last.token)
    expect(second_notification.alert).
      to eq(announcement.body)
  end

  it "will mark announcement as sent" do
    announcement = create(:conference_announcement, sent: false)
    job = AnnouncementJob.new

    job.perform(announcement)

    expect(announcement).to be_sent
  end
end
