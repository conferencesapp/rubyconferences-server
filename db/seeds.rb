require 'net/http'
require 'uri'

conferences = YAML.load(File.read("#{Rails.root}/db/rubyconferences.yml"))
Conference.delete_all

conferences.each do |attributes|
  conference = Conference.new
  conference.name = attributes["name"]
  conference.location = attributes["location"]
  conference.website = attributes["website"]
  conference.twitter_username = attributes["twitter_username"]
  conference.start_date = Date.parse(attributes["start_date"])
  conference.end_date = Date.parse(attributes["end_date"])

  twitter_image_url = URI(
    "https://twitter.com/#{attributes["twitter_username"]}/profile_image?size=bigger"
  )
  res = Net::HTTP.get_response(
    twitter_image_url
  )

  conference.image_url = res['location']

  puts "Saving #{conference.name}"
  conference.save!
end
