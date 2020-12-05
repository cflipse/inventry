class AddProducerToPackage < ActiveRecord::Migration[6.1]
  def change
    change_table :packages do |t|
      t.citext :producer
    end
  end
end
