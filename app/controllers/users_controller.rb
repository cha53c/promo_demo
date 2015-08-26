class UsersController < ApplicationController
  # This will handle actions for displaying and searching user.
  # all account creation and updates and destroys are handled by devise
  after_filter :verify_authorized

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = find_by_id(params[:id])
    authorize @user
  end

  private
  def find_by_id(params_id)
    User.find(params_id)
  end

  def user_params
    # TODO remove the params that are not need now as they are handled by Devise
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
