require "rails_helper"

RSpec.describe Location do
  it "verifies that room + name combinations are unique" do
    described_class.create!(name: "freezer", room: "Utility")

    location = described_class.new(name: "Freezer", room: "Utility")

    expect(location).not_to be_valid
    expect(location.errors[:name]).to be_present
  end

  describe "lookup" do
    let(:location) { Location.create!(name: "freezer", room: "kitchen") }

    it "finds the room by id" do
      expect(Location.lookup(location.id)).to eq location
    end

    it "finds the location by it's param" do
      expect(Location.lookup(location.to_param)).to eq location
    end

    it "ignores case differences" do
      expect(Location.lookup(location.to_param.upcase)).to eq location
    end

    it "requires a room match" do
      expect { Location.lookup("utility-freezer") }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "requires a name match" do
      expect { Location.lookup("kitchen-fridge") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
