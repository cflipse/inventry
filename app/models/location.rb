class Location < ApplicationRecord
  validates :room, presence: true
  validates :name, presence: true, uniqueness: {scope: :room, case_sensitive: false}

  def to_s
    [room, name].join(" ")
  end
end
