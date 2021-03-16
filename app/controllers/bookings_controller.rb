class BookingsController < ApplicationController

def new
  @booking = Booking.new

end

def create
  
end

def show


end


def search
  raise
  @departure = params[:departure]
  @start_date = params[:start_date]
  @nights = params[:nights]
  @place = params[:place]
  @rythm = params[:rythm]
  @passengers = params[:passengers]
  @van_type = params[:van_type]
  # récupérer le van en fonction de passengers et van type
  van = Van.find_from_criteria(@passengers, @van_type)
end

private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

end
