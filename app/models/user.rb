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
    expire_requests
    Request.find_by(snagger:self, status:"in progress")
  end

  def currently_requesting
    expire_requests
    Request.find_by(requester:self, :status => ["open", "in progress"] )
  end

  def expire_requests
    Request.where(:status => ["open", "in progress"]).each do |req|
      if (req.updated_at + 2.hours).past?
        req.update(status: "closed")
        req.save
      end
    end
  end

end
