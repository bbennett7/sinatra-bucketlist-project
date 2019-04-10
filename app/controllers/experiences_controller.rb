class ExperiencesController < ApplicationController
  get '/experiences/new' do
    if logged_in?
      erb :'/experiences/new'
    else
      redirect '/login'
    end
  end

  post '/experiences' do
    raise params.inspect 
    #create experience
  end
end
