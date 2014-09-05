class HomeController < ApplicationController
  helper :clients
  def index
    @promotions = Promotion.all
  end
end
