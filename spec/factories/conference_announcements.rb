FactoryGirl.define do
  factory :conference_announcement do
    body "This is text to be sent"
    conference
  end
end
