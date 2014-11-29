class ConfigurationController < ApplicationController
  def index
    @hall = current_user.hall
    authorize! :update, @hall
  end

  def update
    @hall = Hall.where(id: params[:id]).take
    if @hall.update(hall_params)
      flash[:notice] = t('configuration_update')
      redirect_to dashboard_index_path
    else
      render 'index'
    end
  end

  def view
    @halls = Hall.all
    authorize! :read, current_user.hall
  end

  def show
    @hall = Hall.where(id: params[:id]).take
    authorize! :read, @hall
  end

  def hall_profile
    @hall = Hall.where(id: params[:id]).take
    authorize! :read, @hall
    render 'hall_profile', layout: false
  end

  private

  def hall_params
    params.require(:hall).permit!
  end
end
