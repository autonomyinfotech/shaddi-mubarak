class SettingsController < ApplicationController
  def index
    @services = Service.all
    @event_types = EventType.all
    @outsources = Outsource.all.includes(:service)
  end

  def add_event
    @event_type = EventType.new
  end

  def create_event
    @event_type = EventType.new(event_type_params)
    @event_type.save
  end

  def add_service
    @service = Service.new
  end

  def create_service
    @service = Service.new(service_params)
    @service.save
  end

  def add_outsource
    @outsource = Outsource.new
    @services = Service.all
  end

  def create_outsource
    @outsource = Outsource.new(outsource_params)
    @outsource.save
  end

  private

  def event_type_params
    params.require(:event_type).permit!
  end

  def service_params
    params.require(:service).permit!
  end

  def outsource_params
    params.require(:outsource).permit!
  end
end
