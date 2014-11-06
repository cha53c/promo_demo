class ApplicationController < ActionController::Base
  include Pundit

  before_filter :load_menu_items

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  # loads the menu items for the nav bar
  protected
  def load_menu_items
    @cuisines = Cuisine.all
    @theme = Theme.all
  end

  # private
  public
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end

