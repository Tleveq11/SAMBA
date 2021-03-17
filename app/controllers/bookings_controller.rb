class BookingsController < ApplicationController

def new
  @booking = Booking.new

end

def create

end

def show


end


def search
  @departure = params[:departure]
  result = Geocoder.search(params[:departure]).first.coordinates
  @departure_lat = result[0].to_s
  @departure_long = result[1].to_s
  @start_date = params[:start_date]
  @nights = params[:nights]
  @place = params[:place]
  @rythm = params[:rythm]
  @passengers = params[:passengers]
  @van_type = params[:van_type]

  # récupérer le van en fonction de passengers et van type
  @van = Van.find_from_criteria(@passengers, @van_type)

  # redirect_to results_path

  #affichage mapbox
  @places = Place.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude
  @markers = @places.geocoded.map do |place|
    {
      lat: place.latitude,
      lng: place.longitude
    }
  end

end

private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

end
