class DashboardController < ApplicationController
  def booking
    @date = params[:id]
    @book = Booking.new
  end
end
