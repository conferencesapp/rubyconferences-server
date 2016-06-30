class ConferencesController < ApplicationController
  layout "public"

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(conference_params)
     if @conference.save
       render :thanks
     else
       render :new
     end
  end

  private

  def conference_params
    params.require(:conference).permit(
      :name,
      :location,
      :twitter_username,
      :start_date,
      :end_date,
      :cfp_end_at,
      :website)
  end
end
