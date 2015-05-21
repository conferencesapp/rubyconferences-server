class AnnouncementSender
  def initialize(announcement, device_token, client = APN_CLIENT)
    @announcement = announcement
    @device_token = device_token
    @client = client
  end

  def run
    client.push(notification)
  end

  private

  attr_reader :announcement, :device_token, :client

  def body
    announcement.body
  end

  def notification
    @notification ||= Houston::Notification.new(
      token: device_token,
      alert: body
    )
  end
end
