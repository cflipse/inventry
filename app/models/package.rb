class Package < ApplicationRecord
  belongs_to :location
  belongs_to :food

  def self.food_counts
    group(:food_id).count
  end
end
