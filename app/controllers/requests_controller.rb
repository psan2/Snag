class RequestsController < ApplicationController
  before_action :set_request, only: %i[show destroy snag]
  before_action :include_beers, only: %i[new create]
  before_action :include_locations, only: %i[new create]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    byebug
    if @request.valid?
      @request.save
      redirect_to root_path
    else
      render :new
    end
  end

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

    if @request.snagger_id.nil?
      @snagger = nil
    else
      @snagger = User.find(@request.snagger_id)
    end

    @location = @request.location
    @beer = @request.beer
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
    params.require(:request).permit(:requester_id, :beer_id, :location_id, :status)
  end

  def include_locations
    @locations = Location.all
  end
end
