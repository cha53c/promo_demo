class HomeController < ApplicationController
  helper :clients
  def index
    @promotions = Promotion.published
    render 'promotions/index'
    # redirect_to promotions_path
  end
end
