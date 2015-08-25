class SessionsController < ApplicationController
  # TODO this being replaced by devise
  # after_filter :verify_authorized, only: :destroy

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome! You are logged in"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now.notice = "You have been logged out"
  end
end
