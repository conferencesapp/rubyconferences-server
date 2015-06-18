class Api::V1::ConferencesController < ApplicationController
  def index
    @conferences = Conference.tagged_with("ruby").upcoming

    render(
      json: @conferences,
      each_serializer: ConferenceSerializer,
      root: false
    )
  end
end
