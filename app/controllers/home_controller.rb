class HomeController < ApplicationController


  def index
    @aoi = Aoi.new
  end
end