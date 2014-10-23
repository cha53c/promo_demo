class SearchController < ApplicationController
  helper :clients

  # finds all the promotions for today
  def index
    @promotions=Promotion.find_by_date('yhada yhada')
  end

  def fuzzy
    # TODO factor details out of the controller
    # TODO  avoid sql injection
    param_keyword = "%#{params[:keyword].downcase}%"
    # TODO does not seem to return an array
    @promotions=Promotion.where("lower(description) LIKE ? OR lower(promo_type) LIKE ?", param_keyword, param_keyword)
    render 'home/index'
  end
end
