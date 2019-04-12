class ExperiencesController < ApplicationController
  get '/experiences/new' do
    if logged_in?
      erb :'/experiences/new'
    else
      redirect '/login'
    end
  end

  post '/experiences' do
    if !params[:name].empty? && !params[:city].empty? && !params[:country].empty? && !!params[:bucketlist]
      @experience = Experience.create(name: params[:name], bucketlist: params[:bucketlist], experienced: false)
      @location = Location.find_or_create_by(city: params[:city], country: params[:country])
      @experience[:location_id] = @location.id
      @experience.save

      @user = current_user
      @user.experiences << @experience
      @user.save
      redirect "/experiences/#{@experience.slug}"
    else
      flash[:message] = "Error: All fields are required."
      redirect "/experiences/new"
    end
  end

  get '/experiences/:slug' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      @experience_matches = Experience.find_all_by_slug(params[:slug])
      @experience = @experience_matches.find{|experience| experience.user_id == @user.id}

      if !@experience
        redirect '/login'
      elsif logged_in? && @user.id == @experience.user_id
        erb :'/experiences/show_experience'
      else
        redirect '/login'
      end
    end
  end

  patch '/experiences/:slug/status_change' do
    @user = current_user
    @experience_matches = Experience.find_all_by_slug(params[:slug])
    @experience = @experience_matches.find{|experience| experience.user_id == @user.id}

    @experience[:experienced] = params[:experienced]
    @experience.save

    flash[:message] = "Successfully changed experience status."

    redirect "/experiences/#{@experience.slug}"
  end

  get '/experiences/:slug/edit' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      @experience_matches = Experience.find_all_by_slug(params[:slug])
      @experience = @experience_matches.find{|experience| experience.user_id == @user.id}

      if !@experience
        redirect '/login'
      elsif logged_in? && @user.id == @experience.user_id
        erb :'/experiences/edit_experience'
      else
        redirect '/login'
      end
    end
  end

  patch '/experiences/:slug' do
    if params[:city].empty? && !params[:country].empty?
      flash[:message] = "Error: Must edit city with country."
      redirect "/experiences/#{params[:slug]}/edit"
    elsif !params[:city].empty? && params[:country].empty?
      flash[:message] = "Error: Must edit country with city."
      redirect "/experiences/#{params[:slug]}/edit"
    else
      @user = current_user
      @experience_matches = Experience.find_all_by_slug(params[:slug])
      @experience = @experience_matches.find{|experience| experience.user_id == @user.id}

      @experience[:name] = params[:name] unless params[:name].empty?
      @experience[:bucketlist] = params[:bucketlist] unless !params[:bucketlist]

      unless params[:city].empty? || params[:country].empty?
        @location = Location.find_or_create_by(city: params[:city], country: params[:country])
        @experience[:location_id] = @location.id
      end

      @experience.save

      redirect "/experiences/#{@experience.slug}"
    end
  end

  delete '/delete/:slug' do
    @user = current_user
    @experience_matches = Experience.find_all_by_slug(params[:slug])
    @experience = @experience_matches.find{|experience| experience.user_id == @user.id}
    @experience.destroy
    redirect "/users/#{@user.slug}"
  end
end

#Make sure user can only edit or delete their own experiences

#POST '/experiences'
#{"name"=>"Visit Italy", "city"=>"Venice", "country"=>"Italy ", "bucketlist"=>"Life"}
