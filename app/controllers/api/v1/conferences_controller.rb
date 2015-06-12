class Api::V1::ConferencesController < ApplicationController
  def index
    @conferences = RubyConference.upcoming
  end
end
