class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  unless Rails.env.development?
    protect_from_forgery with: :exception
  end


  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :preferences, :birthday, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :preferences, :birthday, :avatar])
  end

end
