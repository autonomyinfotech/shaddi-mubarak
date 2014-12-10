class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @events = Event.all
    respond_with(@events)
  end

  def new
    @date = params[:date]
    @event_types = EventType.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit
    @event_types = EventType.all
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private

  def set_event
    @event = Event.where(id: params[:id]).take
  end

  def event_params
    params.require(:event).permit!
  end
end
