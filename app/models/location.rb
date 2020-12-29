class Location < ApplicationRecord
  validates :room, presence: true
  validates :name, presence: true, uniqueness: { scope: :room, case_sensitive: false }

  has_many :packages, dependent: :nullify

  def to_s
    [room, name].join(" ")
  end

  def self.rooms
    distinct.pluck(:room)
  end

  def to_param
    [room, name].join("-")
  end

  def self.lookup(param)
    room, name = param.to_s.split("-")

    where(room: room, name: name).or(where(id: param)).first!
  end
end
