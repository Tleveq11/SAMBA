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
  @booking = Booking.create(start_date: @start_date, end_date: @end_date, total_price: @total_price, user_id: current_user.id, van_id: @van.id, price: @total_price)

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
  
  get_start_point
  @counter = 0
end


  def activities
    @booking = current_user.bookings.last
    @nights = (@booking.end_date - @booking.start_date).to_i
    @counter = 1
    @params = [params[:location1],
                params[:location2],
                params[:location3],
                params[:location4],
                params[:location5],
                params[:location6]]
    @saved_params = []
    @params.each_with_index do |param, index|
      if param
        @saved_params << param
        # return => ["38", "40", "41", "39"]
      end
    end
    @saved_params.each do |param|
      BookingPlace.create(place_id: param, booking_id: @booking.id)
    end
  end

  def search_activities

    #mapbox
    @booking = current_user.bookings.last
    @places = @booking.places
    @departure_lat = (43.300000).to_s
    @departure_long = (5.4).to_s
      @markers = @places.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { place: place })
        }
      end

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
    @activities_markers = @activities_selection.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: render_to_string(partial: "info_window2", locals: { activity: activity })
      }
    end
    get_start_point
  end

  def roadbook
    # variables permettant d'afficher le van correspondant au booking
    @booking = current_user.bookings.last
    @van = @booking.van
    @total_price = @booking.total_price
    @nights = (@booking.end_date - @booking.start_date).to_i
    @start = Date.parse(@booking.start_date.to_s).strftime("%d/%m/%Y")
    @end = Date.parse(@booking.end_date.to_s).strftime("%d/%m/%Y")

    # créer des instances de BookingActivity
    # @booking = current_user.bookings.last
    @params = [params[:activity1],
                params[:activity2],
                params[:activity3],
                params[:activity4],
                params[:activity5],
                params[:activity6]]
    @saved_params = []
    @params.each_with_index do |param, index|
      if param
        @saved_params << param
        # return => ["38", "40", "41", "39"]
      end
    end
    @saved_params.each do |param|
      BookingActivity.create(activity_id: param, booking_id: @booking.id)
    end

    #afficher les emplacements
    @selected_places = @booking.booking_places
    @places_markers = @selected_places.map do |bp|
      {
        lat: bp.place.latitude,
        lng: bp.place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: bp.place })
      }
    end

    #afficher les activities
    @selected_activities = @booking.booking_activities
    @activities_markers = @selected_activities.map do |ba|
      {
        lat: ba.activity.latitude,
        lng: ba.activity.longitude,
        infoWindow: render_to_string(partial: "info_window2", locals: { activity: ba.activity })
      }
    end

    get_start_point
  end

  def roadbook_confirmed
    @bookings = current_user.bookings.all
  end


  private


def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :price)
end


  def get_start_point
    @start_point = [
      {
        lat: 43.296482,
        lng: 5.36978
      }
    ]
  end
end
