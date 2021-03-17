class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    required = [:departure, :start_date, :nights, :place, :rythm, :passengers, :van_type]
    form_complete = true
    required.each do |f|
      if params.has_key? f and not params[f].blank?
        # that's good news. do nothing
      else
        form_complete = false
      end
    end
 
    if form_complete
      redirect_to search_index_path
    end
  end
  
  def index
    @departure = params[:departure]
    @start_date = params[:start_date]
    @nights = params[:nights]
    @place = params[:place]
    @rythm = params[:rythm]
    @passengers = params[:passengers]
    @van_type = params[:van_type]
  end

end
