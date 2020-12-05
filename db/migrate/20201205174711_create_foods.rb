class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.citext :name, null: false, index: true
      t.text :description

      t.timestamps
    end
  end
end
