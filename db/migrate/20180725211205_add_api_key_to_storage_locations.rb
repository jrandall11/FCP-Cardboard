class AddApiKeyToStorageLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :storage_locations, :api_key, :string
  end
end