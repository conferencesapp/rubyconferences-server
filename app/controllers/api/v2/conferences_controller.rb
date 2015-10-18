class Api::V2::ConferencesController < Api::BaseController
  def index
    @conferences = conferences
  end

  private

  def conferences
    @conferences || Conference.tagged_with(
      search_params,
      any: true
    ).v2_conferences
  end

  def search_params
    params[:tags].split(",") if params[:tags]
  end
end
