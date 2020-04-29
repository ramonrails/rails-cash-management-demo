class ApplicationController < ActionController::Base
  # we need authentication unless we are at home page
  before_action :authenticate_user!, unless: :home
  # add "role" in addition to email and password, during registration
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    # allow additional field during the registration process
    def configure_permitted_parameters
      # Fields for sign up
      # "role" is also acceptable now
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password) }
    end

  private

    # are we at home page?
    def home
      request.path == root_path
    end
end
