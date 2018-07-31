class AddIslowToStorageLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :storage_locations, :islow, :boolean, default: false
  end
end
