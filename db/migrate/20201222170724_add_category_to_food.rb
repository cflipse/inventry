class AddCategoryToFood < ActiveRecord::Migration[6.1]
  def change
    change_table :foods do |t|
      t.citext :category, null: false, index: true, default: ""
    end
  end
end
