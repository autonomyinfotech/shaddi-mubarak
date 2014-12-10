class HallController < ApplicationController
  def new
    @hall = Hall.new
  end

  def create
    @hall = Hall.new(hall_params)
    if @hall.save
      flash[:notice] = t('configuration_create')
      redirect_to dashboard_index_path
    else
      render 'new'
    end
  end

  def edit
    @hall = Hall.first
  end

  def update
    @hall = Hall.first
    if @hall.update(hall_params)
      flash[:notice] = t('configuration_update')
      redirect_to profile_hall_index_path
    else
      render 'edit'
    end
  end

  def profile
    @hall = Hall.first
  end

  private

  def hall_params
    params.require(:hall).permit!
  end
end
