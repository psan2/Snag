class Beer < ApplicationRecord
    has_many :requests

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :abv, presence: true
    validates :description, presence: true 

end
