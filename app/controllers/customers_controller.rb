class CustomersController < ApplicationController
  before_action :find_event, only: [:new, :create]
  before_action :find_customer, only: [:edit, :update]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    @event.update(customer_id: @customer.id)
    @services = Service.all
  end

  def update
    @customer.update(customer_params)
  end

  def service
    services = params[:services]
    id = params[:id]
    return if services.nil?
    services.each do |s|
      CustomersService.create(customer_id: id, service_id: s)
    end
  end

  private

  def find_customer
    @customer = Customer.where(id: params[:id]).take
  end

  def find_event
    @event = Event.where(id: params[:event_id]).take
  end

  def customer_params
    params.require(:customer).permit!
  end
end
