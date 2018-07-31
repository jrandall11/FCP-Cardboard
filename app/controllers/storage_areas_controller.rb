class StorageAreasController < ApplicationController
    
    def index
        @storage_areas = StorageArea.all 
    end
    
    def show
        @storage_area = StorageArea.find(params[:id])
    end
    
    def new
        @storage_area = StorageArea.new
        respond_to do |format|
            format.js
        end
    end
    
    def create
        @storage_area = StorageArea.new(storage_area_params)
        respond_to do |format|
            if(@storage_area.save)
                format.html { redirect_to @storage_area }
                format.js { render js: "window.location.pathname='#{storage_area_path(@storage_area)}'" }
            else
                format.html { render 'new' }
                format.js
            end
        end
    end
    
    def edit
        @storage_area = StorageArea.find(params[:id])
    end
    
    def update
        @storage_area = StorageArea.find(params[:id])
        respond_to do |format|
            if(@storage_area.update(storage_area_params))
                format.html { redirect_to @storage_area }
                format.js { render js: "window.location.pathname='#{storage_area_path(@storage_area)}'" }
            else
                format.html { render 'edit' }
                format.js
            end
        end
    end
    
    def destroy
        @storage_area = StorageArea.find(params[:id])
        @storage_area.destroy
        redirect_to storage_areas_path
    end
    
    private def storage_area_params
        params.require(:storage_area).permit(:Name)
    end
    
end
