require "rails_helper"

RSpec.describe Location do
  it "verifies that room + name combinations are unique", :aggregate_failures do
    described_class.create!(name: "freezer", room: "Utility", storage: "freezer")

    location = described_class.new(name: "Freezer", room: "Utility", storage: "freezer")

    expect(location).not_to be_valid
    expect(location.errors[:name]).to be_present
  end

  describe "lookup" do
    let(:location) { described_class.create!(name: "freezer", room: "kitchen", storage: "freezer") }

    it "finds the room by id" do
      expect(described_class.lookup(location.id)).to eq location
    end

    it "finds the location by it's param" do
      expect(described_class.lookup(location.to_param)).to eq location
    end

    it "ignores case differences" do
      expect(described_class.lookup(location.to_param.upcase)).to eq location
    end

    it "requires a room match" do
      expect { described_class.lookup("utility-freezer") }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "requires a name match" do
      expect { described_class.lookup("kitchen-fridge") }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
