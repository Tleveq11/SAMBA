class BookingsController < ApplicationController

def search

  @departure = params[:departure]
  result = Geocoder.search(params[:departure]).first.coordinates
  @departure_lat = result[0].to_s
  @departure_long = result[1].to_s

  @start_date = params[:start_date]
  @nights = params[:nights]
  @sleeping_type = params[:place]
  @rythm = params[:rythm]
  @passengers = params[:passengers]
  @van_type = params[:van_type]

  # récupérer le van en fonction de passengers et van type
  @van = Van.find_van_from_criteria(@passengers, @van_type)

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
      lng: place.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { place: place })

    }
  end

  @counter = 0

end

def activities
end

# private

#   def booking_params
#     params.require(:booking).permit(:start_date, :end_date, :total_price)
#   end

end
