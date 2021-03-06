class ApplicationController < ActionController::API
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone city district])
  end
end
