class AnnouncementSender
  def initialize(announcement, device_token)
    @announcement = announcement
    @device_token = device_token
  end

  def run
    Rpush::Apns::Notification.new(
      app: ios_app,
      device_token: device_token,
      alert: body,
      data: { id: announcement.conference_id }
    ).save!
  end

  private

  attr_reader :announcement, :device_token

  def body
    announcement.body
  end

  def ios_app
    @ios_app ||= Rpush::Apns::App.find_by_name("ios_app")
  end
end
