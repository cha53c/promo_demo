class ClientPolicy < ApplicationPolicy

  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
  #   there is no restriction on this
  #   unpublished clients are filtered in the controller
  end

  def show?
    @client.publish? || (user && @user.admin?) || (user && @user.client_id == @client.id)
  end

  def create?
    # user has to be logged in to create
    user && @user.client_id == nil
  end

  def new?
    create?
  end

  def update?
    user.admin? || (user && @user.client_id == @client.id)
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
