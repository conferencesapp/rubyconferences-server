require "rails_helper"

RSpec.describe Conference, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:twitter_username) }

  context "#validations" do
    let(:location) { "India" }
    let(:conference) { create(:conference, active: true, location: location) }
    before do
      expected_latitude = 40.7143528
      expected_longitude = -74.0059731

      Geocoder::Lookup::Test.add_stub(
        location, [
          {
            latitude: expected_latitude,
            longitude: expected_longitude
          }
        ]
      )
    end

    it "validates presence of website" do
      expect(conference).to validate_presence_of(:website)
    end

    it "validates presence of location" do
      expect(conference).to validate_presence_of(:location)
    end

    it "validates presence of start_date" do
      expect(conference).to validate_presence_of(:start_date)
    end

    it "validates presence of end_date" do
      expect(conference).to validate_presence_of(:end_date)
    end
  end

  describe ".upcoming" do
    it "returns upcoming Conferences based on start date" do
      create(:conference, start_date: Date.yesterday)
      later_conference = create(:conference, start_date: Date.today)

      expect(Conference.upcoming).to eq([later_conference])
    end

    it "orders Conferences based on start date" do
      todays_conference = create(:conference, start_date: Date.today)
      later_conference = create(
        :conference,
        start_date: Date.today + 1.day
      )

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
      very_old_conference = create(
        :conference,
        start_date: Date.yesterday - 10.day
      )

      expect(Conference.past).to eq([old_conference, very_old_conference])
    end
  end

  describe "#when" do
    it "calls dateformatter" do
      start_date = Date.today - 1.days
      end_date = Date.today + 1.days
      formatter = double("DateFormatter", to_s: nil)
      allow(DateFormatter).to receive(:new).and_return(formatter)

      build(:conference, start_date: start_date, end_date: end_date).when

      expect(DateFormatter).to have_received(:new).with(start_date, end_date)
      expect(formatter).to have_received(:to_s)
    end
  end

  describe "#cfp_status" do
    context "when cfp_end_at not available" do
      it "is empty" do
        conference = build(:conference, cfp_end_at: nil)

        expect(conference.cfp_status).to eq("CFP date is unknown")
      end
    end

    context "when cfp_end_at available" do
      context "when cfp_end_at is in future" do
        it "is open" do
          cfp_end_date = Time.now + 1.day
          conference = build(:conference, cfp_end_at: cfp_end_date)

          cfp_date = cfp_end_date.strftime("%d %b %Y")
          expect(conference.cfp_status).to eq("CFP is open till #{cfp_date}")
        end
      end

      context "when cfp_end_at is in past" do
        it "is closed" do
          conference = build(:conference, cfp_end_at: Time.now - 1.day)

          expect(conference.cfp_status).to eq("CFP has been closed on #{(Time.now - 1.day).strftime('%d %b %Y')}")
        end
      end
    end
  end

  describe "geocoded_by" do
    it "is geocoded_by location" do
      expected_latitude = 40.7143528
      expected_longitude = -74.0059731

      conference = create(:conference)
      Geocoder::Lookup::Test.add_stub(
        conference.location, [
          {
            latitude: expected_latitude,
            longitude: expected_longitude
          }
        ]
      )

      conference.geocode

      expect(conference.latitude).to eq(expected_latitude)
      expect(conference.longitude).to eq(expected_longitude)
    end
  end
end
