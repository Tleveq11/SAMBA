class BookingsController < ApplicationController

def search

  @departure = params[:departure]
  result = Geocoder.search(params[:departure]).first.coordinates
  @departure_lat = result[0].to_s
  @departure_long = result[1].to_s

  @start_date = params[:start_date]
  @nights = params[:nights]
  @end_date = @start_date.to_date + @nights.to_i
  @sleeping_type = params[:place]
  @rythm = params[:rythm]
  @passengers = params[:passengers]
  @van_type = params[:van_type]
  
  # récupérer le van en fonction de passengers et van type
  @van = Van.find_van_from_criteria(@passengers, @van_type)
  @total_price = @van.price_per_night * @nights.to_i
  @booking = Booking.create(start_date: @start_date, end_date: @end_date, total_price: @total_price, user_id: current_user.id, van_id: @van.id)

  # récupérer les places en fonction du sleeping type
  @radius = 50
  if @rythm == "relax"
    @radius = 40
  elsif @rythme == "moyen"
    @radius = 80
  else
    @radius = 200
  end

  @places_by_type = Place.find_place_from_criteria(@sleeping_type)
  @places_by_distance = Place.near([@departure_lat, @departure_long], @radius)
  @places_selection = @places_by_type & @places_by_distance

  @places = Place.all
  @markers = @places_selection.map do |place|
    {
      lat: place.latitude,
      lng: place.longitude
      #infoWindow: render_to_string(partial: "infowindow", locals: { place: place })
      #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
    }
  end

  @counter = 0

end

def activities
  @booking = current_user.bookings.last
  @nights = (@booking.end_date - @booking.start_date).to_i
  # params[:location1]
end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :total_price)
end

end
