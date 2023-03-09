class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_exists = User.find_by({ "username" => params["user"]["username"] })
    if user_exists
      @user = User.new
      @user["username"] = params["user"]["username"]
      @user["email"] = params["user"]["email"]
      @user["password"] = BCrypt::Password.create(params["user"]["password"])
      @user.save
    else 
      flash["notice"] = "User with this email already exists"
    redirect_to "/"
    end
  end
end
