class Api::V1::StorageAreaSerializer < Api::V1::BaseSerializer
  attributes :id, :Name, :created_at, :updated_at

  has_many :storage_locations

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end