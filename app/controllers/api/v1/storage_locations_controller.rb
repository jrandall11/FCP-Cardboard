class Api::V1::StorageLocationsController < Api::V1::BaseController
  before_action :authenticate_storage_location!, only: [:show, :update, :destroy]
  
  def index
  end
  
  def show
    storage_location = StorageLocation.find(params[:id])

    render(json: Api::V1::StorageLocationSerializer.new(storage_location).to_json)
  end
  
  def create
  end
  
  def update
    storage_area = StorageArea.find(params[:storage_area_id])
    storage_location = StorageLocation.find(params[:id])
    puts toggle_param.inspect

    if !storage_location.update_attributes(toggle_param)
      return api_error(status: 422, errors: storage_location.errors)
    end

    render(
      json: Api::V1::StorageLocationSerializer.new(storage_location).to_json,
      status: 200,
      location: api_v1_storage_area_storage_location_path(storage_area.id,storage_location.id),
      serializer: Api::V1::StorageLocationSerializer
    )
  end
  
  def destroy
  end
  
  private def toggle_param
      params.require(:storage_location).permit(:islow).delete_if{ |k,v| v.nil?}
  end
end