class UsersController < ApplicationController

  get '/users/:slug' do #show's user home page
    if logged_in?
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

end
