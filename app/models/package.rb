class Package < ApplicationRecord
  belongs_to :location
  belongs_to :food
end
