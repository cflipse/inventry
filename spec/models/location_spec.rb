require "rails_helper"

RSpec.describe Location do
  it "verifies that room + name combinations are unique" do
    Location.create!(name: "freezer", room: "Utility")

    location = Location.new(name: "Freezer", room: "Utility")

    expect(location).not_to be_valid
    expect(location.errors[:name]).to be_present
  end
end
