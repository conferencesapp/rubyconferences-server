class DeviceCleanupJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    DeviceCleanup.new.run
  end
end
