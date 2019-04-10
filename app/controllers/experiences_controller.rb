class ExperiencesController < ApplicationController
  get '/experiences/new' do
    if logged_in?
      erb :'/experiences/new'
    else
      redirect '/login'
    end
  end

  post '/experiences' do
    if !params[:name].empty? && !params[:city].empty? && !params[:country].empty? && !params[:bucketlist].empty?
      @experience = Experience.create(name: params[:name], bucketlist: params[:bucketlist], experienced: false)
      @location = Location.find_or_create_by(city: params[:city], country: params[:country])
      @experience[:location_id] = @location.id
      @experience.save

      @user = current_user
      @user.experiences << @experience
      @user.save
      # redirect "/"
    else
      flash[:message] = "Error: Experience must have a name, location and bucketlist"
      redirect "/experiences/new"
    end
  end

  get '/experiences/:slug' do
    if logged_in?
      @experience = Experience.find_by_slug(params[:slug])
      erb :'/experiences/show_experience'
    else
      redirect '/login'
    end
  end

  get '/experiences/:slug/edit' do
    if logged_in?
      @experience = Experience.find_by_slug(params[:slug])
      erb :'/experiences/edit_experience'
    else
      redirect '/login'
    end
  end

  patch '/experiences/:slug' do
    if params[:city].empty? && !params[:country].empty?
      flash[:message] = "Error: Must edit city and country together."
      redirect "/experiences/#{params[:slug]}/edit"
    elsif !params[:city].empty? && params[:country].empty?
      flash[:message] = "Error: Must edit city and country together."
      redirect "/experiences/#{params[:slug]}/edit"
    else
      @experience = Experience.find_by_slug(params[:slug])
      @experience[:name] = params[:name] unless params[:name].empty?
      @experience[:bucketlist] = params[:bucketlist] unless params[:bucketlist].empty?

      @location = Location.find_or_create_by(city: params[:city], country: params[:country])
      @experience[:location_id] = @location.id

      @experience.save

      redirect "/experiences/#{@experience.slug}"
    end
  end

end

#POST '/experiences'
#{"name"=>"Visit Italy", "city"=>"Venice", "country"=>"Italy ", "bucketlist"=>"Life"}
