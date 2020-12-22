# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

uf = Location.find_or_create_by!(room: "Utility", name: "Freezer")
kf = Location.find_or_create_by!(room: "Kitchen", name: "Freezer")

Location.find_or_create_by!(room: "Kitchen", name: "Right Pantry")
Location.find_or_create_by!(room: "Kitchen", name: "Left Pantry")
Location.find_or_create_by!(room: "Kitchen", name: "Refrigerator")

Location.find_or_create_by!(room: "Utility", name: "Rolling Rack")
Location.find_or_create_by!(room: "Utility", name: "Wall Rack")
Location.find_or_create_by!(room: "Utility", name: "Cabinets")

["Whole Chicken", "Chicken Breasts", "Chicken Tenders",
  "Chuck Roast", "Top Round Roast", "Bottom Round Roast",
  "Sirlion Steak", "New York Strip", "Ground Beef",
  "Hamburger Patties", "Del Monaco", "Sirloin Tip Roast",
  "Supreme Pizza", "Pepperoni Pizza", "Cheese Pizza"].each do |name|
  Food.find_or_create_by!(name: name)
end

Package.destroy_all

[
  [uf, "Whole Chicken", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "3 lbs", added_on: 3.months.ago],
  [uf, "Whole Chicken", "Honeybrook Farms", store: "Leesburg Farmer's Market", quantity: "3.3 lbs", added_on: 2.weeks.ago],
  [uf, "Whole Chicken", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "4 lbs", added_on: 2.weeks.ago],
  [uf, "Supreme Pizza", "Red Baron", store: "Giant", quantity: 1, added_on: 1.month.ago],
  [uf, "Supreme Pizza", "Red Baron", store: "Giant", quantity: 1],
  [kf, "Supreme Pizza", "Red Baron", store: "Giant", quantity: 1, added_on: 1.day.ago],
  [kf, "Cheese Pizza", "Red Baron", store: "Giant", quantity: 1],
  [kf, "Pepperoni Pizza", "Red Baron", store: "Giant", quantity: 1, added_on: 2.weeks.ago],
  [uf, "Pepperoni Pizza", "DiGerono", store: "Giant", quantity: 1, added_on: 2.weeks.ago],
  [uf, "Hamburger Patties", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "4"],
  [uf, "Hamburger Patties", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "4"],
  [uf, "Ground Beef", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "1 lb"],
  [uf, "Ground Beef", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "1 lb"],
  [kf, "Ground Beef", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "1 lb"],
  [uf, "Ground Beef", "Kirkland", store: "CostCo", quantity: "1 lb", added_on: 6.months.ago],
  [uf, "Ground Beef", "Kirkland", store: "CostCo", quantity: "1 lb", added_on: 6.months.ago],
  [kf, "Ground Beef", "Kirkland", store: "CostCo", quantity: "1 lb", added_on: 6.months.ago],
  [uf, "Chicken Breasts", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "1.3 lb"],
  [uf, "Chicken Breasts", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "1.2 lb"],
  [kf, "Chicken Tenders", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "1.4 lb"],
  [uf, "Chicken Breasts", "Tysons", store: "Giant", quantity: "1.5 lb"],
  [uf, "Chicken Breasts", "Perdue", store: "Giant", quantity: "2.4 lb"],
  [uf, "Top Round Roast", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "3 lbs", added_on: 1.month.ago],
  [uf, "Bottom Round Roast", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "2.5 lbs", added_on: 2.months.ago],
  [uf, "Bottom Round Roast", "Honeybrook Farms", store: "Reston Farmer's Market", quantity: "4.2 lbs", added_on: 2.months.ago]
].shuffle.each do |location, name, producer, opts|
  Package.create!(location: location, food: Food.find_by!(name: name), producer: producer, **opts)
end
