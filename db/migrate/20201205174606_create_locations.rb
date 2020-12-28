class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    exec_query 'CREATE EXTENSION IF NOT EXISTS "citext"'

    create_table :locations do |t|
      t.citext :name, null: false
      t.citext :room, null: false, index: true

      t.timestamps
      t.index [:name, :room], unique: true
    end
  end
end
