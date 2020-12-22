class Food < ApplicationRecord
  validates :name, presence: true

  has_many :packages

  scope :in_stock, -> { where id: Package.distinct.select(:food_id) }
end
