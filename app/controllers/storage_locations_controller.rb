class StorageLocationsController < ApplicationController
    
    def index
    end
    
    def new
        @storage_area = StorageArea.find(params[:storage_area_id])
        @storage_location = @storage_area.storage_locations.build
        respond_to do |format|
            format.js
        end
    end
    
    def create
        @storage_area = StorageArea.find(params[:storage_area_id])
        @storage_location = @storage_area.storage_locations.create(storage_location_params)
        
        respond_to do |format|
            if(@storage_location.save)
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render js: "window.location.pathname='#{storage_area_storage_location_path(@storage_area, @storage_location)}'" }
            else
                format.html { render :new }
                format.js
            end
        end
    end
    
    def destroy
        @storage_location = StorageLocation.find(params[:id])
        @storage_location.destroy
        flash[:success] = "Storage location deleted."
        redirect_to storage_area_path(params[:storage_area_id])
    end
    
    def show
        @storage_area = StorageArea.find(params[:storage_area_id])
        @storage_location = StorageLocation.find(params[:id])
    end
    
    def edit
        @storage_area = StorageArea.find(params[:storage_area_id])
        @storage_location = StorageLocation.find(params[:id])
    end
    
    def update
        @storage_area = StorageArea.find(params[:storage_area_id])
        @storage_location = StorageLocation.find(params[:id])
        
        respond_to do |format|
            if @storage_location.update(storage_location_params)
              format.html { redirect_to storage_area_storage_location_path(@storage_area,@storage_location), :notice => 'Storage location was successfully updated.' }
              format.js { render js: "window.location.pathname='#{storage_area_storage_location_path(@storage_area,@storage_location)}'" }
            else
              format.html { render 'edit' }
              format.js
            end
        end
    end
    
    def incCur
        respond_to do |format|
            @storage_area = StorageArea.find(params[:storage_area_id])
            @storage_location = StorageLocation.find(params[:storage_location_id])
            curAmount = storage_location_curField[:curAmount].to_i
            @storage_location.increment(:Cur_Quantity, by=curAmount)
            if @storage_location.save
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js
            else
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'error.js.erb' }
            end
        end
    end
    
    def decCur
        respond_to do |format|
            @storage_area = StorageArea.find(params[:storage_area_id])
            @storage_location = StorageLocation.find(params[:storage_location_id])
            curAmount = storage_location_curField[:curAmount].to_i
            @storage_location.decrement(:Cur_Quantity, by=curAmount)
            if @storage_location.save
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'incCur.js.erb' }
            else
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'error.js.erb' }
            end
        end
    end
    
    def incMax
        respond_to do |format|
            @storage_area = StorageArea.find(params[:storage_area_id])
            @storage_location = StorageLocation.find(params[:storage_location_id])
            maxAmount = storage_location_maxField[:maxAmount].to_i
            @storage_location.increment(:Max_Quantity, by=maxAmount)
            if @storage_location.save
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js
            else
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'error.js.erb' }
            end
        end
    end
    
    def decMax
        respond_to do |format|
            @storage_area = StorageArea.find(params[:storage_area_id])
            @storage_location = StorageLocation.find(params[:storage_location_id])
            maxAmount = storage_location_maxField[:maxAmount].to_i
            @storage_location.decrement(:Max_Quantity, by=maxAmount)
            if @storage_location.save    
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'incMax.js.erb' }
            else
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'error.js.erb' }
            end
        end
    end
    
    def incDef
        respond_to do |format|
            @storage_area = StorageArea.find(params[:storage_area_id])
            @storage_location = StorageLocation.find(params[:storage_location_id])
            defAmount = storage_location_defField[:defAmount].to_i
            @storage_location.increment(:Def_Quantity, by=defAmount)
            if @storage_location.save    
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js 
            else
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'error.js.erb' }
            end
        end
    end
    
    def decDef
        respond_to do |format|
            @storage_area = StorageArea.find(params[:storage_area_id])
            @storage_location = StorageLocation.find(params[:storage_location_id])
            defAmount = storage_location_defField[:defAmount].to_i
            @storage_location.decrement(:Def_Quantity, by=defAmount)
            if @storage_location.save
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'incDef.js.erb' }
            else
                format.html { redirect_to storage_area_storage_location_path(@storage_area, @storage_location) }
                format.js { render 'error.js.erb' }
            end
        end
    end
    
    private def storage_location_params
        params.require(:storage_location).permit(:Name, :Cur_Quantity, :Max_Quantity, :Def_Quantity, :storage_area_id)
    end
    
    private def storage_location_curField
        params.require(:storage_location).permit(:curAmount)
    end
    
    private def storage_location_maxField
        params.require(:storage_location).permit(:maxAmount)
    end
    
    private def storage_location_defField
        params.require(:storage_location).permit(:defAmount)
    end
    
    private def storage_location_Name
        params.require(:storage_location).permit(:Name)
    end
end
