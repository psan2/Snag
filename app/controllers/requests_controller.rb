class RequestsController < ApplicationController
  before_action :set_request, only: %i[edit update destroy]
  before_action :include_beers, only: %i[new create edit update]

  def open; end

  def index; end

  def snag
    
  end

  def new
    @request = Request.new
  end

  def create
    byebug
    @request = Request.new(request_params)

    if @request.valid?
      @request.save
      redirect_to Request.last
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def include_beers
    @beers = Beer.all
  end

  def request_params
    params.require(:request).permit(:requester_id, :snagger_id, :beer_id)
  end
end
