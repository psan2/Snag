# frozen_string_literal: true

class MyValidator < ActiveModel::Validator
  def validate(request)
    unless request.requester_id != request.snagger_id
      request.errors[:error] << "Can't snag your own beer! That's what friends are for :)"
    end
  end
end

class Request < ApplicationRecord
  belongs_to :requester, :class_name => :User, :foreign_key => "requester_id"
  belongs_to :snagger, :class_name => :User, :foreign_key => "snagger_id", optional: true
  belongs_to :beer
  belongs_to :location

  validates_with MyValidator
  validates :status, inclusion: { in: ["open", "closed", "in progress"]}

  def self.open
    Request.all.select { |snag| snag.snagger_id.nil? && not(snag.requester_id.nil?) && snag.status == "open" && (snag.updated_at + 2.hours).future?  }
  end

  def self.bar_open?
    (15...24).include?(Time.now.hour) ? true : false
  end

end
