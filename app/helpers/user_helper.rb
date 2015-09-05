module UserHelper
  def users_own_details?
    current_user.id == @user.id
  end
end
