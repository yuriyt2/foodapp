class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def profile
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to foods_path
    else
      redirect_to index_path
  end
end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
