RailsAdmin.config do |config|
  config.authorize_with do
    authenticate_or_request_with_http_basic('rubyconferences admin') do |username, password|
      username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASSWORD']
    end
  end

  config.actions do
    all
  end
end
