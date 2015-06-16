class Api::V1::ConferencesController < ApplicationController
  def index
    @conferences = RubyConference.upcoming

    render(
      json: @conferences,
      each_serializer: ConferenceSerializer,
      root: false
    )
  end
end
