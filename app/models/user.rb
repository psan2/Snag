# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :requests
  belongs_to :mod

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :mod_id, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true

  def currently_snagging
    Request.find_by(snagger:self, status:"in progress")
  end

  def currently_requesting
    Request.find_by(requester:self, :status => ["open", "in progress"] )
  end

  def completed_snags
    snags = Request.where(snagger:self, status:"closed")
    if snags.length > 0
      snags
    else
      []
    end
  end

  def fulfilled_requests
    requests = Request.where(requester:self, status:"closed")
    if requests.length > 0
      requests
    else
      []
    end
  end

  def snag_ratio
    ratio = (completed_snags.length.to_f)/fulfilled_requests.length
    if completed_snags.length > 0 && fulfilled_requests.length == 0
      1.0
    elsif fulfilled_requests.length == 0
      0.0
    else
      ratio
    end
  end

  def unique_receivers
    completed_snags.map { |request| request.requester}
  end

  private
  def new_user?
    new_record?
  end
end
