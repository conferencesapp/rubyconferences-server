require_relative 'rpush'

RailsAdmin.config do |config|
  config.authorize_with do
    authenticate_or_request_with_http_basic('rubyconferences admin') do |username, password|
      username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASSWORD']
    end
  end

  config.actions do
    all
  end

  config.included_models = RailsAdmin::Config.models_pool << 'Delayed::Job'

  config.model Delayed::Job do
    label 'Task'
    navigation_label 'Background Processing'
  end

  config.included_models = RailsAdmin::Config.models_pool << 'Rpush::Apns::Notification'

  config.model Rpush::Apns::Notification do
    label 'Apple Push Notifications'
    navigation_label 'Push Notifications'
  end
end
