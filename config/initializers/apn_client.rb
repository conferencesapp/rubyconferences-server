if Rails.env.production?
  APN_CLIENT = Houston::Client.production
else
  APN_CLIENT = Houston::Client.development
end
APN_CLIENT.certificate = File.read(ENV.fetch("PUSH_NOTIFICATION_CERTIFICATE_PATH"))
