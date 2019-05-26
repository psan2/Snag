class Request < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :beer

  def set_request
    @request = Request.find(params[:id])
  end
end
