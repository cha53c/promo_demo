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
      logger.info("user_id: #{current_user.id} create new user: #{@user.email}")
      flash.now.notice="New user: #{@user.email} created"
      render 'show'
    else
      logger.warn("user_id: #{current_user.id} failed to create new user: #{@user.email}")
      flash.now.alert="New user: #{@user.email} could not be created"
      render "new"
    end
  end

  def destroy
    @user = find_by_id(params[:id])
    authorize @user
    @user.destroy
    logger.info("user_id: #{current_user.id} deleted user #{@user.email}")
    redirect_to users_path, notice: "User #{@user.email} has been deleted"
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
    # TODO ask for confirmation before updating records
    @user = find_by_id(params[:id])
    authorize @user
    org_user_email = @user.email
    if @user.update(user_params)
      logger.info("user_id #{current_user.id} updated details for user #{org_user_email}")
      flash.now.notice="User #{@user.email} details updated"
      render 'show'
    else
      logger.warn("user_id #{current_user.id} attempted to update details for user #{org_user_email}, but update failed")
      flash.now.alert="Failed to update details for User #{org_user_email}"
      render 'edit'
    end
  end

  private
  def find_by_id(params_id)
    User.find(params_id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
