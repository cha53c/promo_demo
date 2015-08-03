class UserPolicy < ApplicationPolicy
  attr_reader :crnt_user, :user

  def initialize(crnt_user, user)
    @crnt_user = crnt_user
    @user = user
  end

 def destroy?
   puts '#{crnt_user.id} attempting to delete a user'
   puts 'Check User has permissions to destroy'
   crnt_user.admin?
 end
end
