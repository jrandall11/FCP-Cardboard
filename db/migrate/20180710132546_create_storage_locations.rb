class CreateStorageLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :storage_locations do |t|
      t.string :Name
      t.integer :Cur_Quantity
      t.integer :Max_Quantity
      t.integer :Def_Quantity
      t.integer :storage_area_id

      t.timestamps
    end
  end
end
