class CreateStorageAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :storage_areas do |t|
      t.string :Name

      t.timestamps
    end
  end
end
