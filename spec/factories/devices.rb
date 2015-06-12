FactoryGirl.define do
  factory :device do
    sequence(:token) { |n| "token-#{n}" }
    conference_type "ruby"
  end
end
