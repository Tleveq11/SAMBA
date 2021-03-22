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
      lng: place.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { place: place })

    }
  end
  @counter = 0
end

def activities
  @booking = current_user.bookings.last
  @nights = (@booking.end_date - @booking.start_date).to_i
  # params[:location1]
end

def search_activities
    # récupérer les places en fonction de category
  @params = [params[:category_randonnée],
             params[:category_baignade],
             params[:category_villes],
             params[:category_culture],
             params[:category_détente],
             params[:category_animaux],
             params[:category_familial],
             params[:category_sensations],
             params[:category_gastronomie]]

  @categories = ["randonnée", "balnéaire", "villages", "culture", "détente", "animaux", "familial", "sensations", "gastronomie"]
  @choices = []
  @params.each_with_index do |param, index|
    if param == "1"
      @choices << @categories[index]
    end
  end
  @activities_selection = Activity.where(category: @choices)
end

private

def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
end

end
