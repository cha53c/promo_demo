class ClientPolicy < ApplicationPolicy

  def initialize(user, client)
    @user = user
    @client = client
  end

  def index?
    user
    # all non logged in users can see published clients
    # scope.where(:id => record.id).published?
  end

  def show?
    # TODO this is for development only
    # false
    # user

    # All non logged in users can see records that are published
    puts "Is published: #{@client.publish?} "
    @client.publish?

    # admins can view unpublished records
    # user.admin?

    # user is a member of the client
    # user && user.client_id == record.id
  end

  def create?
    # user have to be logged in to create
    user
  end

  def new?
    create?
  end

  def update?
    user


    # admins can view unpublished records
    # user.admin?

    # user is a member of the client
    # user.client_id == record.id

  end

  def edit?
    update?
  end

  def destroy?
    user

    # admins can view unpublished records
    # user.admin?

    # user is a member of the client
    # user.client_id == record.id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
