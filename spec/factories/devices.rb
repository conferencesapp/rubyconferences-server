FactoryGirl.define do
  factory :device do
    sequence(:token) { |n| "4dae0f8c9135ad92#{n}e1cdf9ff87daa6f7336b7f07ca8ab0aa1b12b2dd1b20792" }
   conference_type "ruby"
  end
end
