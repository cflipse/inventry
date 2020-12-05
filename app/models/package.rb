class Package < ApplicationRecord
  belongs_to :location
  belongs_to :food

  validates :name, presence: true
end
