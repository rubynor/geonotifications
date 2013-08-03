class AoisController < ApplicationController

  def create
    area = params.require(:area).permit(:title, locations: [])
    area[:locations] = area[:locations].collect do |loc|
      loc.split(',').map(&:to_f)
    end

    aoi = Aoi.new(area)
    if aoi.save
      redirect_to root_url
    else
      raise "invalid aoi"
    end

  end

end