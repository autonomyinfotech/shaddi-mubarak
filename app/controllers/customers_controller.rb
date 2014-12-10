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
  end

  def update
    @customer.update(customer_params)
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
