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
      redirect "/experiences/#{@experience.slug}"
    else
      flash[:message] = "Error: Experience must have a name, location and bucketlist"
      redirect "/experiences/new"
    end
  end

  get '/experiences/:slug' do
    @user = current_user
    @experience = Experience.find_by_slug(params[:slug])

    if logged_in? && @user.id == @experience.user_id
      erb :'/experiences/show_experience'
    else
      redirect '/login'
    end
  end

  patch '/experiences/:slug/status_change' do
    @experience = Experience.find_by_slug(params[:slug])
    @experience[:experienced] = params[:experienced]
    @experience.save

    redirect "/experiences/#{@experience.slug}"
  end

  get '/experiences/:slug/edit' do
    @user = current_user
    @experience = Experience.find_by_slug(params[:slug])

    if logged_in? && @user.id == @experience.user_id 
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

  delete '/delete/:slug' do
    @experience = Experience.find_by_slug(params[:slug])
    @experience.destroy
    @user = current_user
    redirect "/users/#{@user.slug}"
  end
end

#Make sure user can only edit or delete their own experiences

#POST '/experiences'
#{"name"=>"Visit Italy", "city"=>"Venice", "country"=>"Italy ", "bucketlist"=>"Life"}
