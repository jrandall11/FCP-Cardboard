class Api::V1::BaseController < ApplicationController
    protect_from_forgery with: :null_session

    before_action :destroy_session
    
    def destroy_session
        request.session_options[:skip] = true
    end
    
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_found
        return api_error(status: 404, errors: 'Not found')
    end
    
    def paginate(resource)
        resource = resource.page(params[:page] || 1)
        if params[:per_page]
          resource = resource.per_page(params[:per_page])
        end
    
        return resource
    end

    #expects pagination!
    def meta_attributes(object)
        {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.previous_page,
          total_pages: object.total_pages,
          total_count: object.total_entries
        }
    end
    
    def unauthenticated!
        response.headers['WWW-Authenticate'] = "Token realm=Application"
        render json: { error: 'Bad credentials' }, status: 401
    end
    
    def authenticate_storage_location!
        token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    
        storage_location_id = options.blank?? nil : options[:id]
        storage_location = storage_location_id && StorageLocation.find_by(id: storage_location_id)
        puts token.inspect
        puts options[:id].inspect
    
        if storage_location && ActiveSupport::SecurityUtils.secure_compare(storage_location.api_key, token)
          @current_storage_location = storage_location
        else
          return unauthenticated!
        end
    end
end
