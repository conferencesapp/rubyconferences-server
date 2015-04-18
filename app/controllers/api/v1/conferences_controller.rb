class Api::V1::ConferencesController < ApplicationController
  def index
    @conferences = Conference.upcoming
  end

  def show
    @conference = Conference.find(params[:id])
  end
end
