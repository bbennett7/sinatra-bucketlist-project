class UsersController < ApplicationController

  get '/users/:slug' do #show's user home page 
    erb :'/users/show'
  end

end
