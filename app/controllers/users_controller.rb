class UsersController < ApplicationController
  after_filter :verify_authorized

  def index
    @users = User.all
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end

  def destroy
    # TODO
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
