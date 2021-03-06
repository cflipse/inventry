# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_01_193950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_enum :storage_type, [
    "freezer",
    "refrigerator",
    "pantry",
  ], force: :cascade

  create_table "foods", force: :cascade do |t|
    t.citext "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.citext "category", default: "", null: false
    t.index ["category"], name: "index_foods_on_category"
    t.index ["name"], name: "index_foods_on_name"
  end

  create_table "locations", force: :cascade do |t|
    t.citext "name", null: false
    t.citext "room", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.enum "storage", null: false, enum_name: "storage_type"
    t.index ["name", "room"], name: "index_locations_on_name_and_room", unique: true
    t.index ["room"], name: "index_locations_on_room"
  end

  create_table "packages", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "food_id", null: false
    t.date "expires_on"
    t.date "added_on"
    t.citext "quantity"
    t.citext "store"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.citext "producer"
    t.index ["food_id"], name: "index_packages_on_food_id"
    t.index ["location_id"], name: "index_packages_on_location_id"
  end

  add_foreign_key "packages", "foods"
  add_foreign_key "packages", "locations"
end
