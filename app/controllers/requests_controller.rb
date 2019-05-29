class RequestsController < ApplicationController
  before_action :set_request, only: %i[show destroy snag]
  before_action :include_beers, only: %i[new]
  before_action :include_locations, only: %i[new]

  def snag
    @request.snagger_id = params["snagger_id"]
    if @request.valid?
      @request.save
      redirect_to @request
    else
      flash[:error] = @request.errors[:error].join
      @snags = Request.snags
      render "welcome/home"
    end
  end

  def show
    @requester = User.find(@request.requester_id)
    @snagger = User.find(@request.snagger_id)
    @location = @request.location
    @beer = @request.beer
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.valid?
      @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy; end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def include_beers
    @beers = Beer.all
  end

  def request_params
    params.require(:request).permit(:requester_id, :beer_id, :location_id)
  end

  def include_locations
    @locations = Location.all
  end
end
