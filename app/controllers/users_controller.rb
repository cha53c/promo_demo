class UsersController < ApplicationController
  after_filter :verify_authorized

  def index
    @users = User.all
    authorize @users
  end

  # new shows the page with the fields to create the user
  # note the user is not created by this method, that is done by create
  def new
     @user = User.new
     authorize @user
   end
  # create actually create the user in the database, using the data received from the form
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
    # only admins can do this
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    # TODO
  #   if admin set user role
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
