class Api::V1::ConferencesController < ApplicationController
  respond_to :json, :ics

  def index
    respond_with do |format|
      format.json do
        render(
          json: conferences,
          each_serializer: ConferenceSerializer,
          root: false
        )
      end
      format.ics { render text: conferences_calendar, type: :ics }
    end
  end

  private

  def default_tag
    "ruby"
  end

  def conferences
    @conferences || Conference.tagged_with(default_tag).upcoming
  end

  def conferences_calendar
    ConferencesCalendar.new(conferences, "Ruby Conferences").to_ical
  end
end
