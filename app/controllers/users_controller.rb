class UsersController < ApplicationController

  get '/users/:slug' do #show's user home page
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/locations' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show_locations'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/:bucketlist' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      @bucketlist = (params[:bucketlist]).capitalize
      erb :'/users/show_bucketlist'
    else
      redirect '/login'
    end
  end

end

#Make sure user can only edit or delete their own experiences
