class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy snag]
  before_action :include_beers, only: %i[new create edit update]

  def open; end

  def index; end

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
    @beer = @request.beer
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(beer_id:request_params["beer_id"], requester_id:current_user.id)
    if @request.valid?
      @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def include_beers
    @beers = Beer.all
  end

  def request_params
    params.require(:request).permit(:requester_id, :snagger_id, :beer_id)
  end
end
