class UsersController < ApplicationController
  def index
    @users = User.all_users(current_user)
    authorize! :read, current_user
  end

  def show
    @user = User.where(id: params[:id]).take
    authorize! :read, @user
  end

  def edit
    @user = User.where(id: params[:id]).take
    authorize! :update, @user
  end

  def update
    @user = User.where(id: params[:id]).take
    if @user.update(user_params)
      flash[:notice] = t('user_password_update')
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
