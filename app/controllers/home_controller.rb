class HomeController < ApplicationController
  def index
    # TODO this should probably call the index action on promotions
    @promotions = Promotion.all
  end
end
