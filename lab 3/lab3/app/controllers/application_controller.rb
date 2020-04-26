class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden, content_type: 'text/html' }
          format.html { redirect_to '/auth/login', notice: exception.message }
          format.js   { head :forbidden, content_type: 'text/html' }
        end
    end
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        end
end
