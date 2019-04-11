require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'app/public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?
      @user = current_user
      redirect "/users/#{@user.slug}"
    else
      erb :index
    end
  end

  get '/signup' do
    if logged_in?
      @user = current_user
      redirect "/users/#{@user.slug}"
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    if !params[:name].empty? && !params[:email].empty? && !params[:username].empty? && !params[:passowrd].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Error: All fields are required for signup."
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      @user = current_user
      redirect "/users/#{@user.slug}"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    elsif params[:username].empty? || params[:password].empty?
      flash[:message] = "Error: All fields are required for login."
      redirect '/login'
    elsif !@user || !@user.authenticate(params[:password])
      flash[:message] = "Error: Username and password combination not found."
      redirect '/login'
    else
      flash[:message] = "Error: Unable to login."
      redirect '/login'
    end
  end

  post '/logout' do
    redirect '/logout'
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
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
