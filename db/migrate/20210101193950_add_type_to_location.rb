class AddTypeToLocation < ActiveRecord::Migration[6.1]
  def change

    create_enum :storage_type, %w( freezer refrigerator pantry )

    change_table :locations do |t|
      t.enum :storage, enum_name: :storage_type, null: false
    end
  end
end
