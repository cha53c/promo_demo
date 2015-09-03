class UserPolicy < ApplicationPolicy
  attr_reader :crnt_user, :user

  def initialize(crnt_user, user)
    @crnt_user = crnt_user
    @user = user
  end

  def index?
    @crnt_user && @crnt_user.admin?
  end

  def show?
    (@crnt_user && @crnt_user.admin?) || (@crnt_user.id == @user.id)
  end

  def destroy?
    @crnt_user && @crnt_user.admin?
  end

  # def create?
  #   user
  # end
  #
  # def new?
  #   create?
  # end
  #
  # def update?
  #   user
  # end
  #
  # def edit?
  #   update?
  # end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end
