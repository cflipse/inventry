require "rails_helper"

RSpec.describe Package, type: :model do
  describe ".food_counts" do
    it "tallies up food totals" do
      location = Location.create(name: "Freezer", room: "Kitchen")

      ground = Food.create!(name: "Ground Beef")
      chicken = Food.create!(name: "Chicken Breast")
      Food.create!(name: "Beef Sirloin")

      3.times { Package.create!(food: ground, location: location) }
      2.times { Package.create!(food: chicken, location: location) }

      expect(described_class.food_counts).to eq(
        ground.id => 3,
        chicken.id => 2
      )
    end
  end
end
