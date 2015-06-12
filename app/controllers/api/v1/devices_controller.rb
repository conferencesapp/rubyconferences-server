class Api::V1::DevicesController < ApplicationController
  before_action :authenticate
  skip_before_action :verify_authenticity_token, only: :create

  def create
    creator = DeviceCreator.new(device_params)

    if creator.create
      head :ok
    else
      render json: creator.device.errors, status: :unprocessable_entity
    end
  end

  private

  def device_params
    params.require(:device).permit(:token, :conference_type)
  end
end
