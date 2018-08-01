json.storage_areas do
  json.array!(@storage_areas) do |storage_area|
    json.name storage_area.Name
    json.url storage_area_path(storage_area)
  end
end

json.storage_locations do
  json.array!(@storage_locations) do |storage_location|
    json.name storage_location.Name
    json.url storage_area_storage_location_path(storage_location.storage_area_id, storage_location)
  end
end