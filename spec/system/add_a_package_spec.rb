require "rails_helper"

RSpec.describe "Adding a new package", type: :system do
  it "adds to an existing food" do
    steak = Food.create!(name: "Steak", category: "Beef")
    pork = Food.create!(name: "Pork Chop", category: "Pork")
    Location.create!(name: "Freezer", room: "Utility")

    visit "/inbox"

    select "Steak", from: "Food"
    select "Utility Freezer", from: "Location"

    fill_in "Producer", with: "Honeybrook Farms"
    fill_in "Store", with: "Reston Farm Market"

    fill_in "Quantity", with: "1 lb"

    click_on "Store package"

    select "Pork Chop", from: "Food"
    fill_in "Quantity", with: "1.5 lbs"

    fill_in "Notes", with: "thin sliced"

    click_on "Store package"

    expect(steak).to have(1).package
    expect(pork).to have(1).package

    pork_package = pork.packages.first
    expect(pork_package.notes).to eq "thin sliced"
    expect(pork_package.producer).to eq "Honeybrook Farms"
  end
end
