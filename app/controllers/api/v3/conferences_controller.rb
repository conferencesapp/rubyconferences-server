class Api::V3::ConferencesController < Api::V2::ConferencesController
  private

  def conferences
    @conferences || Conference.tagged_with(
      search_params,
      any: true
    ).upcoming
  end
end
