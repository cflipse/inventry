# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.find_or_create_by!(room: "Utility", name: "Freezer")
Location.find_or_create_by!(room: "Kitchen", name: "Freezer")

Location.find_or_create_by!(room: "Kitchen", name: "Right Pantry")
Location.find_or_create_by!(room: "Kitchen", name: "Left Pantry")
Location.find_or_create_by!(room: "Kitchen", name: "Refrigerator")

Location.find_or_create_by!(room: "Utility", name: "Rolling Rack")
Location.find_or_create_by!(room: "Utility", name: "Wall Rack")
Location.find_or_create_by!(room: "Utility", name: "Cabinets")
