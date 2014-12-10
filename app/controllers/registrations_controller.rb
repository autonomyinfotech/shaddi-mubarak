class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(*)
    new_hall_path
  end

  def after_update_path_for(*)
    profile_users_path
  end

  def sign_up_params
    params.require(:user).permit!
  end

  def account_update_params
    params.require(:user).permit!
  end
end
