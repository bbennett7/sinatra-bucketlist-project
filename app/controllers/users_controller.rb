class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in? && @user == current_user
      erb :'/users/show_homepage'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/travels' do
    @user = User.find_by_slug(params[:slug])
    @traveled_locations = @user.experiences.collect do |experience|
      experience.location if experience.experienced == true
    end

    @traveled_locations.compact!
    @traveled_locations.uniq!
    @bucketlist_locations = @user.experiences.collect do |experience|
      experience.location if experience.experienced == false
    end

    @bucketlist_locations.compact!
    @bucketlist_locations.uniq!

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
