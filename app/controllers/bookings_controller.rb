class BookingsController < ApplicationController

def new
  @booking = Booking.new

end

def create

end

def show


end

private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

end
