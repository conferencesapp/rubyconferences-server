class Api::V1::ConferencesController < Api::BaseController
  skip_before_action :authenticate

  respond_to :json, :ics

  def index
    @conferences = conferences
    respond_with do |format|
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
