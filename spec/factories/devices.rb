FactoryGirl.define do
  factory :device do
    sequence(:token) { |n| "token-#{n}" }
  end
end
