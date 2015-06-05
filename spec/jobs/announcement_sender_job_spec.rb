require 'rails_helper'

describe AnnouncementSenderJob, type: :job do
  it "will invoke AnnouncementSender for device" do
    sender = double("Sender", run: nil)
    allow(AnnouncementSender).to receive(:new).and_return(sender)
    device = create(:device)
    announcement = create(:announcement)
    job = AnnouncementSenderJob.new

    job.perform(announcement, device)

    expect(AnnouncementSender).
      to have_received(:new).with(announcement, device.token)
  end
end
