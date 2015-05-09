class Api::V1::DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    Device.create(device_params)

    head :ok
  end

  private

  def device_params
    params.require(:device).permit(:token)
  end
end
