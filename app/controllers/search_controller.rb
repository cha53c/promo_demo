class SearchController < ApplicationController
  helper :clients

  # finds all the promotions for today
  def index
    puts params
    @promotions=Promotion.find_by_date(params[:date])
  end

  def fuzzy
    # TODO  avoid sql injection
    @promotions=Promotion.find_promotion_text("%#{params[:keyword].downcase}%")

    render 'home/index'
  end
end
