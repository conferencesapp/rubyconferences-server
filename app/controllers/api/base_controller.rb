class Api::BaseController < ApplicationController
  before_action :authenticate
end
