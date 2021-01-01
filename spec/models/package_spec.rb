require "rails_helper"

RSpec.describe Package, type: :model do
  describe ".food_counts" do
    it "tallies up food totals" do
      location = Location.create(name: "Freezer", room: "Kitchen", storage: "freezer")

      ground = Food.create!(name: "Ground Beef", category: "Beef")
      chicken = Food.create!(name: "Chicken Breast", category: "Chicken")
      Food.create!(name: "Beef Sirloin", category: "Beef")

      3.times { described_class.create!(food: ground, location: location) }
      2.times { described_class.create!(food: chicken, location: location) }

      expect(described_class.food_counts).to eq(
        ground.id => 3,
        chicken.id => 2
      )
    end
  end
end
