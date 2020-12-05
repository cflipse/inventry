class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.citext :name, null: false
      t.citext :room, null: false, index: true

      t.timestamps
    end
  end
end
