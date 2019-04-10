class UsersController < ApplicationController

  get '/users/:slug' do #show's user home page
    if logged_in?
      @user.find_by_slug(params[:slug])
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

end
