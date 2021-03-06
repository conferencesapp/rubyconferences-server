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

  config.model Conference do
    field :name
    field :location
    field :twitter_username
    field :description
    field :start_date
    field :end_date
    field :logo
    field :latitude
    field :longitude
    field :website
    field :cfp_end_at
    field :active
    field :tag_list
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

  config.included_models = RailsAdmin::Config.models_pool << 'Rpush::Apns::Feedback'

  config.model Rpush::Apns::Feedback do
    label 'Apple Push Feedbacks'
    navigation_label 'Apple Feedbacks'
  end
end
