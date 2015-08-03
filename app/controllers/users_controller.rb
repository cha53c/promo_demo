class UsersController < ApplicationController
  # TODO log all audit trail of all actions
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
    @user = User.find(params[:id])
    # only admins can do this
    authorize @user
    # TODO implement destroy
    # @user.destroy
    puts '#{user.id} deleted'
    # TODO include user id in flash message
    redirect_to users_path, notice: 'User x has been deleted'
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
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      flash.now.notice="User details updated"
      render 'edit'
    else
      flash.now.alert='User details update failed'
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
