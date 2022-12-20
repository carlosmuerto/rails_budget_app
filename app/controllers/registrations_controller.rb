class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(*)
    users_path
  end
end
