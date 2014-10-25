class SearchController < ApplicationController
  helper :clients

  # finds all the promotions base on date
  def index
    @promotions=Promotion.find_by_date(params[:date])
  end

  # finds results based on text search
  def fuzzy
    # TODO  avoid sql injection
    @promotions=Promotion.find_promotion_text("%#{params[:keyword].downcase}%")

    render 'index'
  end
end
