class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  protected

  def after_sign_in_path_for(*)
    groups_path
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer
    default_parameters = %i[name]
    devise_parameter_sanitizer.permit(:sign_up, keys: default_parameters)
    devise_parameter_sanitizer.permit(:sign_in, keys: default_parameters)
    devise_parameter_sanitizer.permit(:account_update, keys: default_parameters)
    # .permit(:sign_up, keys: [:name])
  end
end
