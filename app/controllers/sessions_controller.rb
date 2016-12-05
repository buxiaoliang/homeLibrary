class SessionsController < ApplicationController
  include SessionsHelper
  def create
    login = params[:session][:login]
    password = params[:session][:password]
    user = User.find_by_login(login)
    if user && user.authenticate(password)
      log_in(user)
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid login or password."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
