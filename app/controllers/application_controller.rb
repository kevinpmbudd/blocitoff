class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_paramaters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource) 
  end

  protected

  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
