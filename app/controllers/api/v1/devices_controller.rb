class Api::V1::DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    device = Device.find_or_create_by(token: device_params[:token])

    if device.save
      head :ok
    else
      render json: device.errors, status: :unprocessable_entity
    end
  end

  private

  def device_params
    params.require(:device).permit(:token)
  end
end
