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
      # TODO add name of user in flash message
      logger.info('new user created')
      flash.now.notice='New User created'
      render 'show'
    else
      logger.warn('failed to create new user')
      flash.now.alert='User could not be created'
      render "new"
    end
  end

  def destroy
    @user = find_by_id(params[:id])
    # only admins can do this
    authorize @user
    @user.destroy
    puts '#{@user.id} deleted'
    # TODO include user id in flash message
    redirect_to users_path, notice: 'User x has been deleted'
  end

  def show
    @user = find_by_id(params[:id])
    authorize @user
  end

  def edit
    @user = find_by_id(params[:id])
    authorize @user
  end

  def update
    @user = find_by_id(params[:id])
    authorize @user
    if @user.update(user_params)
      logger.info('user x updated user details for user y')
      flash.now.notice="User details updated"
      render 'show'
    else
      logger.warn('user x attempted to update details for user y, but update failed')
      flash.now.alert='User details update failed'
      render 'edit'
    end
  end

  private
  def find_by_id(params_id)
    User.find(params_id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
