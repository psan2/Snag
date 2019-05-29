# frozen_string_literal: true

class WelcomeController < ApplicationController
  def home
    @snags = Request.snags
    @current_snag = current_user.current_snag
    unless @current_snag.nil?
      @current_snag_for = User.find(@current_snag.requester_id)
    end
  end
end
