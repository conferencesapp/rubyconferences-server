class DeviceCleanup
  def self.run
    new.run
  end

  def run
    import_feedbacks
    remove_devices
  end

  private

  def import_feedbacks
    Rpush.apns_feedback
  end

  def remove_devices
    Rpush::Apns::Feedback.find_each do |feedback|
      Device.find_by(token: feedback.device_token).try(:destroy)
    end
  end
end
