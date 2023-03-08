class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"username" => params["username"]})
    
    if @user
      
      if params["password"] == @user["password"]
        redirect_to "/places"
      else
        redirect_to "/sessions/new"
      end
    
    else
      redirect_to "/sessions/new"
    end

  end

  def destroy
  end

end
  