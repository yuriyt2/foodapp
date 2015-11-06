class SessionsController < ApplicationController

  def create
    username = params[:username]
    password = params[:password]
    user = User.find_by({username:username})
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to foods_path
      else
        redirect_to users_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end

end
