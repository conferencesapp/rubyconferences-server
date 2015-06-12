class DeviceCreator
  attr_reader :device

  def initialize(params)
    @params = params
  end

  def create
    @device ||= Device.find_or_create_by(
      token: token,
      conference_type: conference_type
    )
  end

  private

  attr_reader :params

  def token
    params[:token]
  end

  def conference_type
    params[:conference_type] || "ruby"
  end
end
