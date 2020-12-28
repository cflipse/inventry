require "rails_helper"

RSpec.describe Location do
  it "verifies that room + name combinations are unique" do
    described_class.create!(name: "freezer", room: "Utility")

    location = described_class.new(name: "Freezer", room: "Utility")

    expect(location).not_to be_valid
    expect(location.errors[:name]).to be_present
  end
end
