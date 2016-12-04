class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

  private
    def authorize_admin
      redirect_to root_path unless current_user.try(:admin?)
    end

    def authorize
      redirect_to root_path unless user_signed_in?
    end
end
