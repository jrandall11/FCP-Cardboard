class StorageArea < ApplicationRecord
    has_many :storage_locations
    validates :Name, presence: true
end
