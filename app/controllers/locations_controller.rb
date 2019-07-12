class LocationsController < ApplicationController
  get '/travels/:slug/map' do
    @user = current_user
    @location = Location.find_by_slug(params[:slug])

    erb :'/locations/map'
  end
end
