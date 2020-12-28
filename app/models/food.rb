class Food < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true

  has_many :packages, dependent: :destroy

  scope :in_stock, -> { where id: Package.distinct.select(:food_id) }
end
