require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    #shows homepage with login and signup
    erb :index
  end

  get '/signup' do
    if logged_in?
      #redirect to user homepage
    else
      #shows signup page
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    if !params[:name].empty? && !params[:email].empty? && !params[:username].empty? && !params[:passowrd].empty?
      @user = User.create(params) #creates user
      session[:user_id] = @user.id #log user in
    #redirect #user homepage
    else
      flash[:message] = "Error: All fields are required for signup."
      redirect '/signup'
    end
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      user = User.find(session[:user_id])
    end
  end
end
