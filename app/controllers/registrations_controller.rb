class RegistrationsController < Devise::RegistrationsController
  def create
    super
    @user.create_hall
  end

  private

  def after_sign_up_path_for(resource)
    resource.admin ? dashboard_index_path : new_configuration_path
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
