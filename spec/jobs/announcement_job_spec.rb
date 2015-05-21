require 'rails_helper'

describe AnnouncementJob, type: :job do
  it "will invoke AnnouncementSender for devices" do
    sender = double("Sender", run: nil)
    allow(AnnouncementSender).to receive(:new).and_return(sender)
    devices = create_list(:device, 2)
    announcement = create(:announcement)
    job = AnnouncementJob.new

    job.perform(announcement)

    devices.each do |device|
      expect(AnnouncementSender).
        to have_received(:new).with(announcement, device.token)
    end
  end

  it "will mark announcement as sent" do
    announcement = create(:announcement, sent: false)
    job = AnnouncementJob.new

    job.perform(announcement)

    expect(announcement).to be_sent
  end
end
