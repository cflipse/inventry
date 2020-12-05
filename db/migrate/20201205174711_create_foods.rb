class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false, index: true
      t.string :description

      t.timestamps
    end
  end
end
