# frozen_string_literal: true

class Keg < ApplicationRecord
  belongs_to :floor
  belongs_to :beer
end
