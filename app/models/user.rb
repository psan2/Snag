# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :requests

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :mod_id, presence: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true

end
