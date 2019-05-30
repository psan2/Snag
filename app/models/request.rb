# frozen_string_literal: true
class Request < ApplicationRecord
  belongs_to :requester, :class_name => :User, :foreign_key => "requester_id"
  belongs_to :snagger, :class_name => :User, :foreign_key => "snagger_id", optional: true
  belongs_to :beer
  belongs_to :location

  validate :cannot_snag_own_beer
  validates :status, inclusion: { in: ["open", "closed", "in progress", "cancelled", "bailed"]}

  def cannot_snag_own_beer
    if requester_id == snagger_id
      errors.add(:snagger, "cannot be the same as requester, that's what friend are for!")
    end
  end

  def self.open
    Request.all.select { |snag| snag.status == "open" && (snag.updated_at + 2.hours).future?  }
  end

  def self.bar_open?
    # commented out for testing - this function closes the bar before 3 PM
    true
    # (15...24).include?(Time.now.hour) ? true : false
  end

end
