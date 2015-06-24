require "rails_helper"

describe "/api/v1/conferences" do
  describe "get conferences" do
    context "for JSON" do
      it "will render conferences tagged with ruby" do
        ruby_conference = create(:conference, :ruby)
        create(:conference, :javascript)

        get "/api/v1/conferences"

        expect(json.count).to eq(1)
        expect(json.first["id"]).to eq(ruby_conference.id)
        expect(json.first["name"]).to eq(ruby_conference.name)
      end

      it "will render upcoming conferences" do
        upcoming_ruby_conference = create(:conference, :ruby, :upcoming)
        create(:conference, :ruby, :past)

        get "/api/v1/conferences"

        expect(json.count).to eq(1)
        expect(json.first["id"]).to eq(upcoming_ruby_conference.id)
        expect(json.first["name"]).to eq(upcoming_ruby_conference.name)
      end
    end

    context "for ics" do
      it "will call ConferencesCalendar with conferences tagged with ruby" do
        conferences_calendar = double("ConferencesCalendar", to_ical: true)
        allow(ConferencesCalendar).
          to receive(:new).and_return(conferences_calendar)
        ruby_conference = create(:conference, :ruby)
        create(:conference, :javascript)

        get "/api/v1/conferences.ics"

        expect(ConferencesCalendar).
          to have_received(:new).with([ruby_conference], "Ruby Conferences")
      end

      it "will call ConferencesCalendar with upcoming conferences" do
        conferences_calendar = double("ConferencesCalendar", to_ical: true)
        allow(ConferencesCalendar).
          to receive(:new).and_return(conferences_calendar)
        upcoming_ruby_conference = create(:conference, :ruby, :upcoming)
        create(:conference, :ruby, :past)

        get "/api/v1/conferences.ics"

        expect(ConferencesCalendar).
          to have_received(:new).with(
            [upcoming_ruby_conference],
            "Ruby Conferences"
        )
      end
    end
  end
end
