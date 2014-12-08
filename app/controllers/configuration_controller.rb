class ConfigurationController < ApplicationController
  def new
    @hall = Hall.new
  end

  def create
    @hall = Hall.new(hall_params)
    if @hall.save
      current_user.update(hall_id: @hall.id)
      flash[:notice] = t('configuration_create')
      redirect_to dashboard_index_path
    else
      render 'new'
    end
  end

  def edit
    @hall = current_user.hall
  end

  def update
    @hall = Hall.where(id: params[:id]).take
    if @hall.update(hall_params)
      flash[:notice] = t('configuration_update')
      redirect_to profile_configuration_index_path
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

  def profile
    @hall = current_user.hall
  end

  private

  def hall_params
    params.require(:hall).permit!
  end
end
