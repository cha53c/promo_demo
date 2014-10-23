class SearchController < ApplicationController
  helper :clients

  # finds all the promotions for today
  def index
    @promotions=Promotion.find_by_date('yhada yhada')
  end

  def fuzzy
    # TODO  avoid sql injection
    @promotions=Promotion.find_promotion_text("%#{params[:keyword].downcase}%")

    render 'home/index'
  end
end
