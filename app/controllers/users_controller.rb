class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && @user == current_user
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/locations' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && @user == current_user
      erb :'/users/show_locations'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/:bucketlist' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && @user == current_user 
      @bucketlist = (params[:bucketlist]).capitalize
      erb :'/users/show_bucketlist'
    else
      redirect '/login'
    end
  end

end
