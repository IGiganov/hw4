class PlacesController < ApplicationController

  def index
      if @current_user
        @places = Place.where({ "user_id" => @current_user["id"] })
      end
  end

  def show
    if @current_user
      @place = Place.find_by({ "id" => params["id"], "user_id" => @current_user["id"] })
      @posts = Post.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    end
  end

  def new
    if @current_user
      @place = Place.new
    end
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["place"]["name"]
      @place["user_id"] = @current_user["id"]
      @place.save
    else
      flash["notice"] = "Please login first"
      redirect_to "/sessions/new"
    end
    redirect_to "/places"
  end

end
