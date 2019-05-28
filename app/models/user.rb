class User < ApplicationRecord
  has_many :requests

    validates :name, presence: true
    validates :mod_id, presence: true

end
