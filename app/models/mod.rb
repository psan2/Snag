class Mod < ApplicationRecord
    has_many :users

    validates :name, presence: true
end
