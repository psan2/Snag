# frozen_string_literal: true

class WelcomeController < ApplicationController
  def home
    @snags = Request.snags
  end
end
