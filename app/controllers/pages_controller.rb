class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @disable_nav = true
    # required = [:departure, :start_date, :nights, :place, :rythm, :passengers, :van_type]
    # form_complete = true
    # required.each do |f|
    #   if params.has_key? f and not params[f].blank?
    #     # that's good news. do nothing
    #   else
    #     form_complete = false
    #   end
    # end
 
    # if form_complete
    #   redirect_to search_index_path
    # end
  end
  
  
end
