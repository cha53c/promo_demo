class ApplicationController < ActionController::Base
  include Pundit

  before_filter :load_menu_items

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # update strong params for devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # TODO role is only allowed in sign_up for development - REMOVE
    devise_parameter_sanitizer.for(:sign_up) << :role
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :role
  end

  # configure routes for devise workflow

  def after_sign_in_path_for (resource)
    # TODO after sign in user should to the 'client' description page
    # TODO if they have not created one then they will be shown new page.
    # TODO once they of created a page they will be directed to that on signin
    new_client_path
  end

  # def after_sign_in_path_for(resource)

  # end

  # loads the menu items for the nav bar
  protected
  def load_menu_items
    @cuisines = Cuisine.all
    logger.debug 'loaded ' + @cuisines.length.to_s + ' Cuisines'
    @theme = Theme.all
    logger.debug 'loaded ' + @theme.length.to_s + ' Themes'

  end

end

