class AnnouncementSenderJob < ActiveJob::Base
  queue_as :default

  def perform(announcement, device)
    AnnouncementSender.new(announcement, device.token).run
  end
end
