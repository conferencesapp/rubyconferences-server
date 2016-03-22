require "rails_helper"

RSpec.describe ConferenceAnnouncement, type: :model do
  describe "#validations" do
    it { should validate_presence_of(:conference_id) }
    it { should validate_presence_of(:body) }
  end

  describe "#associations" do
    it { should belong_to :conference }
  end
end
