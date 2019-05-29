# frozen_string_literal: true

class MyValidator < ActiveModel::Validator
  def validate(request)
    unless request.requester_id != request.snagger_id
      request.errors[:error] << "Can't snag your own beer! That's what friends are for :)"
    end
  end
end

class Request < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :beer
  belongs_to :location

  validates_with MyValidator

  def self.snags
    Request.all.select { |snag| snag.snagger_id.nil? }
  end
end
