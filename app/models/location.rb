class Location < ApplicationRecord
  has_many :packages, dependent: :nullify

  enum storage: {
    freezer: "freezer",
    refrigerator: "refrigerator",
    pantry: "pantry",
  }

  validates :room, presence: true
  validates :name, presence: true, uniqueness: { scope: :room, case_sensitive: false }

  validates :storage, inclusion: { in: storages.keys }

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
