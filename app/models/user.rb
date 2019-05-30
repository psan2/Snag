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

<<<<<<< HEAD
  def completed_snags
    Requests.where(snagger:self, status:"closed")
  end
=======
 
>>>>>>> 2f825e8c133ee6aca9a9c7d60a78391b63ccb1b4

  def fulfilled_requests
    Requests.where(requester:self, status:"closed")
  end

  def snag_ratio
    ratio = (completed_snags.length.to_f)/
  end

  private
  def new_user?
    new_record?
  end
end
