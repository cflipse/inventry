class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :room, null: false, index: true

      t.timestamps
    end
  end
end
