class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_exists = User.find_by({ "email" => params["user"]["email"] })

    if user_exists
      flash["notice"] = "User with this email already exists"
    else 
      @user = User.new
      @user["username"] = params["user"]["username"]
      @user["email"] = params["user"]["email"]
      @user["password"] = BCrypt::Password.create(params["user"]["password"])
      @user.save
    end
    redirect_to "/sessions/new"
  end
end
