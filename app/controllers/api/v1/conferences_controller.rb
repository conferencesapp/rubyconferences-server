class Api::V1::ConferencesController < ApplicationController
  def index
    @conferences = Conference.upcoming
  end
end
