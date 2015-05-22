if Rails.env.production?
  APN_CLIENT = Houston::Client.production
else
  APN_CLIENT = Houston::Client.development
end

if Rails.env.test?
  APN_CLIENT.certificate = ""
else
  APN_CLIENT.certificate = File.read(ENV.fetch("PUSH_NOTIFICATION_CERTIFICATE_PATH"))
end
