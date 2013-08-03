class PoisController < ApplicationController
  before_action :set_poi, only: [:show, :edit, :update, :destroy]

  # GET /pois
  def index
    @pois = Poi.all
  end

  # GET /pois/1
  def show
  end

  # GET /pois/new
  def new
    @poi = Poi.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  def create
    @poi = Poi.new(poi_params)

    if @poi.save
      redirect_to @poi, notice: 'Poi was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pois/1
  def update
    if @poi.update(poi_params)
      redirect_to @poi, notice: 'Poi was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pois/1
  def destroy
    @poi.destroy
    redirect_to pois_url, notice: 'Poi was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poi
      @poi = Poi.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poi_params
      params[:poi][:location] = [params[:poi].delete(:longitude), params[:poi].delete(:latitude)]
      params.require(:poi).permit(:location, :category, :title, :description)
    end
end
