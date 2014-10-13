class SessionsController < ApplicationController
  def show
    render 'login'
  end

  def login
    # TODO implement
    flash.discard

    if (params["login"]["pass"] != "abc123")

      flash[:alert] = "Invalid Username or Password"
    else
      flash[:notice] = "Welcome"
    end
  end

  def logout
  end
end
