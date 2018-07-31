class Api::V1::StorageAreasController < Api::V1::BaseController
  def show
    storage_area = StorageArea.find(params[:id])

    render(json: Api::V1::StorageAreaSerializer.new(storage_area).to_json)
  end
end