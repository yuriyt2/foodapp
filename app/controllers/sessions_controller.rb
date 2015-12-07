class SessionsController < ApplicationController
skip_before_action :authenticate


  def create
    username = params[:username]
    password = params[:password]
    user = User.find_by({username:username})
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect_to foods_path
      else
        flash.notice = "*incorrect username or password*"
        redirect_to users_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end

end
