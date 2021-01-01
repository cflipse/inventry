require "rails_helper"

RSpec.describe Food, type: :model do
  describe ".in_stock" do
    it "limits foods to only entries that have a package" do
      freezer = Location.create!(room: "Kitchen", name: "Freezer", storage: "freezer")
      in_stock = described_class.create!(name: "Chicken Breast", category: "Chicken")
      described_class.create!(name: "Pork Tenderloin", category: "Pork")

      Package.create!(food: in_stock, location: freezer)

      expect(described_class.in_stock).to match_array([in_stock])
    end
  end
end
