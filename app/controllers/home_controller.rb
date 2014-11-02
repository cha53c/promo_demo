class HomeController < ApplicationController
  helper :clients
  def index
    @promotions = Promotion.all
    # @cuisines = Cuisine.all
  end
end
