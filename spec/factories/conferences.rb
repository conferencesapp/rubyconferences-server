FactoryGirl.define do
  factory :conference do
    name "Conference Name"
    location "Conference Location"
    start_date Date.today
    end_date Date.today
    twitter_username "twiiter"
    image_url "image_url"
    website "foo.bar"
  end
end
