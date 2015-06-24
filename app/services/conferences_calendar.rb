class ConferencesCalendar
  def initialize(conferences, calendar_name)
    @conferences = conferences
    @calendar_name = calendar_name
  end

  def to_ical
    calendar.to_ical
  end

  private

  attr_reader :conferences, :calendar_name

  def calendar
    Icalendar::Calendar.new.tap do |cal|
      cal.x_wr_calname = calendar_name

      conferences.each do |conference|
        cal.event do |event|
          event.summary = conference.name
          event.description = conference.description
          event.dtstart = Icalendar::Values::Date.new(conference.start_date)
          event.dtend = Icalendar::Values::Date.new(conference.end_date)
        end
      end
    end
  end
end
