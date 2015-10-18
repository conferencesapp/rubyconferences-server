class AnnouncementJob < ActiveJob::Base
  queue_as :default

  def perform(announcement)
    Device.all.each_with_index do |device|
      AnnouncementSender.new(announcement, device.token).run
    end

    announcement.update(sent: true)
  end
end
