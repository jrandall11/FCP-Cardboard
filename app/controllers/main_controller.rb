class MainController < ApplicationController
    
    def index
    end
    
    def notifications
        @storage_locations = StorageLocation.all
    end
    
    def autocomplete 
        @storage_areas = StorageArea.ransack(Name_cont: params[:q]).result.limit(5)
        @storage_locations = StorageLocation.ransack(Name_cont: params[:q]).result.limit(5) 
    end
    
    def search 
        @storage_areas = StorageArea.ransack(Name_cont: params[:q]).result
        @storage_locations = StorageLocation.ransack(Name_cont: params[:q]).result
        
        respond_to do |format|
            format.html
            format.json {
                @storage_areas = @storage_areas.limit(5)
                @storage_locations = @storage_locations.limit(5)
            }
        end
    end
end
