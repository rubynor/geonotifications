class AoisController < ApplicationController
  before_action :authenticate_user!
  respond_to :json, :html

  def index
    @aoi = current_user.aois
    respond_with @aoi
  end

  def create
    area = params.require(:area).permit(:title, locations: [])
    area[:locations] = area[:locations].collect do |loc|
      loc.split(',').map(&:to_f)
    end

    aoi = Aoi.new(area)
    aoi.user = current_user

    if aoi.save
      redirect_to root_url
    else
      raise "invalid aoi"
    end

  end

end