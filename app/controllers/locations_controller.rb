class LocationsController < ApplicationController
  get '/map' do
    erb :'/locations/map'
  end

end
