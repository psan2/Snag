class RequestsController < ApplicationController
  before_action :set_request, only: %i[update show destroy]
  before_action :include_beers, only: %i[new create]
  before_action :include_locations, only: %i[new create]

  def index
    @open_requests = Request.open
    @currently_snagging = current_user.currently_snagging
    @currently_requesting = current_user.currently_requesting
  end

  def new
    # if !(Request.bar_open?)
    #   redirect_to closed_path
    # else
      if
        @request = Request.new
      end
    # end
  end

  def create
    @request = Request.new(request_params)
    if @request.valid?
      @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def update
    @request.update(request_params)
    if @request.valid?
      @request.save
      if @request.status == "in progress"
        redirect_to @request
      else
        redirect_to requests_path
      end
    else
      flash[:error] = @request.errors[:error].join
      @open_requests = Request.open
      render :index
    end
  end

  def show
    @requester = @request.requester

    if @request.snagger_id.nil?
      @snagger = nil
    else
      @snagger = @request.snagger
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
    params.require(:request).permit(:requester_id, :snagger_id, :beer_id, :location_id, :status)
  end

  def include_locations
    @locations = Location.all
  end
end
