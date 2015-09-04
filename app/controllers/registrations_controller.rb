class RegistrationsController < Devise::RegistrationsController
  protected
  def after_update_path_for(resource_or_scope)
    # TODO this will only work for the owner not for the admin
    # For the now Admin will not be able to edit the user, due to the way devise works
    user_path(resource_or_scope)
  end
end