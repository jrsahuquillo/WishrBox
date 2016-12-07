class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  unless Rails.env.development?
    protect_from_forgery with: :exception
  end


  before_action :configure_permitted_parameters, if: :devise_controller?



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
