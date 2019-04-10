class UsersController < ApplicationController

  get '/users/:slug' do #show's user home page
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/:bucketlist' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      if params[:bucketlist] == "life"
        erb :'/users/show_life'
      elsif params[:bucketlist] == "spring"
        erb :'/users/show_spring'
      elsif params[:bucketlist] == "summer"
        erb :'/users/show_summer'
      elsif params[:bucketlist] == "fall"
        erb :'/users/show_fall'
      elsif params[:bucketlist] == "winter"
        erb :'/users/show_winter'
      end
    else
      redirect '/login'
    end
  end

end
