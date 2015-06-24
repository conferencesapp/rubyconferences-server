require "rails_helper"

describe ConferencesCalendar do
  describe "#to_ical" do
    it "will generate ical for given conferences with name" do
      conference = create(:conference)
      name = "foo"
      conferences_calendar = ConferencesCalendar.new([conference], name)

      ical = conferences_calendar.to_ical

      parsed_ical = Icalendar.parse(ical).first
      event = parsed_ical.events.first
      expect(parsed_ical.custom_properties["x_wr_calname"]).to eq([name])
      expect(event.summary).to eq(conference.name)
      expect(event.dtstart).to eq(conference.start_date)
      expect(event.dtend).to eq(conference.end_date)
      expect(event.description).to eq(conference.description)
    end
  end
end
