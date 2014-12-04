class DashboardController < ApplicationController
  def index
    @books = Booking.all
    respond_to do |format|
      format.html
      format.json { render json: (@books) }
    end
  end

  def booking
    @date = params[:date]
    @book = Booking.new
  end

  def create_booking
    @book = Booking.new(book_params)
    @book.save
  end

  private

  def book_params
    params.require(:booking).permit!
  end
end
