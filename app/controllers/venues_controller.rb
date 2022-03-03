class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end

    def show 
       @venue = Venue.find(params[:id])
    end
  end
end
