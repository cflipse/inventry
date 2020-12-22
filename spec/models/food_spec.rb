require "rails_helper"

RSpec.describe Food, type: :model do
  describe ".in_stock" do
    it "limits foods to only entries that have a package" do
      freezer = Location.create!(room: "Kitchen", name: "Freezer")
      in_stock = Food.create!(name: "Chicken Breast")
      Food.create!(name: "Pork Tenderloin")

      Package.create!(food: in_stock, location: freezer)

      expect(Food.in_stock).to match_array([in_stock])
    end
  end
end
