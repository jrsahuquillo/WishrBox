class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  unless Rails.env.development?
    protect_from_forgery with: :exception
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
