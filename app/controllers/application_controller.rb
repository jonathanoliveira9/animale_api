class ApplicationController < ActionController::API
  include Pagy::Backend
  protect_from_forgery with: :exception

end
