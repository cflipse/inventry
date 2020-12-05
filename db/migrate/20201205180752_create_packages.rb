class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.references :location, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.date :expires_on
      t.date :added_on
      t.citext :quantity
      t.citext :store
      t.text :notes

      t.timestamps
    end
  end
end
