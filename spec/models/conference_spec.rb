require 'rails_helper'

RSpec.describe Conference, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:twitter_username) }
  it { should validate_presence_of(:image_url) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  describe ".upcoming" do
    it "returns upcoming Conferences based on start date" do
      create(:conference, start_date: Date.yesterday)
      later_conference = create(:conference, start_date: Date.today)

      expect(Conference.upcoming).to eq([later_conference])
    end

    it "orders Conferences based on start date" do
      todays_conference = create(:conference, start_date: Date.today)
      later_conference = create(:conference, start_date: Date.today + 1.day)

      expect(Conference.upcoming).to eq([todays_conference, later_conference])
    end
  end

  describe ".past" do
    it "returns past Conferences based on start date" do
      old_conference = create(:conference, start_date: Date.yesterday)
      create(:conference, start_date: Date.today)

      expect(Conference.past).to eq([old_conference])
    end

    it "orders Conferences based on start date" do
      old_conference = create(:conference, start_date: Date.yesterday)
      very_old_conference = create(:conference, start_date: Date.yesterday - 10.day)

      expect(Conference.past).to eq([old_conference, very_old_conference])
    end
  end
end
