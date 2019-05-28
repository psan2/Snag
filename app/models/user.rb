class User < ApplicationRecord
  has_many :requests
  belongs_to :mod

    validates :name, presence: true
    validates :mod_id, presence: true

end
