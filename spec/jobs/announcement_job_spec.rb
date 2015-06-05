require 'rails_helper'

describe AnnouncementJob, type: :job do
  it "will invoke AnnouncementSenderJob for devices" do
    allow(AnnouncementSenderJob).to receive(:perform_later)
    devices = create_list(:device, 2)
    announcement = create(:announcement)
    job = AnnouncementJob.new

    job.perform(announcement)

    devices.each do |device|
      expect(AnnouncementSenderJob).
        to have_received(:perform_later).with(announcement, device)
    end
  end

  it "will mark announcement as sent" do
    announcement = create(:announcement, sent: false)
    job = AnnouncementJob.new

    job.perform(announcement)

    expect(announcement).to be_sent
  end
end
