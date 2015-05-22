set :output, {:error => 'log/corn_error.log', :standard => 'log/cron.log'}

every 12.hours do
  runner "DeviceCleanupJob.perform_later"
end
