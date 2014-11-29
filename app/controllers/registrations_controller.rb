class RegistrationsController < Devise::RegistrationsController
  layout false

  def create
    super
    @user.create_hall
  end

  private

  def sign_up_params
    params.require(:user).permit!
  end

  def account_update_params
    params.require(:user).permit!
  end
end
