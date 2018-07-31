class Api::V1::StorageLocationSerializer < Api::V1::BaseSerializer
  attributes :id, :Name, :Cur_Quantity, :Max_Quantity,  :Def_Quantity, :storage_area_id, :created_at, :updated_at, :islow

  has_one :storage_area

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end