class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :home
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      # Fields for sign up
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password) }
    end

  private

    def home
      request.path == root_path
    end
end
