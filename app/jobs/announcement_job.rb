class AnnouncementJob < ActiveJob::Base
  queue_as :default

  def perform(announcement)
    Device.all.each_with_index do |device|
      AnnouncementSenderJob.perform_later(announcement, device)
    end

    announcement.update(sent: true)
  end
end
