class Location < ApplicationRecord
  validates :room, presence: true
  validates :name, presence: true, uniqueness: {scope: :room, case_sensitive: false}
end
