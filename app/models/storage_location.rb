class StorageLocation < ApplicationRecord
    belongs_to :storage_area
    validates :Name, presence: true
    validates :Cur_Quantity, :Max_Quantity, :Def_Quantity, presence:true, 
                                                           numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :Cur_Quantity, :Def_Quantity, numericality: { less_than: :Max_Quantity }
    
    before_create :generate_api_key
    
    attr_accessor :curAmount, :maxAmount, :defAmount
    
    def generate_api_key
        loop do
            self.api_key = SecureRandom.base64(64)
            break unless StorageLocation.find_by(api_key: api_key)
        end
    end
    
    
    #getter
    def curAmount
        @curAmount.to_i
    end
    #setter
    def curAmount=(val)
        @curAmount= val 
    end
    
    #getter
    def maxAmount
        @maxAmount.to_i
    end
    #setter
    def curAmount=(val)
        @maxAmount= val 
    end
    
    #getter
    def defAmount
        @defAmount.to_i
    end
    #setter
    def defAmount=(val)
        @defAmount= val 
    end
                             
end
