FactoryGirl.define do
  factory :conference do
    name "Conference Name"
    location "Conference Location"
    start_date Date.today
    end_date Date.today
    twitter_username "twiiter"
    image_url "image_url"
    website "foo.bar"

    trait :ruby do
      tag_list "ruby"
    end

    trait :javascript do
      tag_list "javascript"
    end

    trait :design do
      tag_list "design"
    end

    trait :upcoming do
      start_date Date.today + 100.days
      end_date Date.today + 101.days
    end

    trait :past do
      start_date Date.today - 100.days
      end_date Date.today - 101.days
    end
  end
end
