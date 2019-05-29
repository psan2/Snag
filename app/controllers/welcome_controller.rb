# frozen_string_literal: true
class WelcomeController < ApplicationController
  skip_before_action :require_login, only: :home

  def home
  end

  def closed
  end

end
