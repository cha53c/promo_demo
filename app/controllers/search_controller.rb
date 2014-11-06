class SearchController < ApplicationController
  helper :clients

  # finds all the promotions base on date
  def index
    if params.has_key?(:date)
      @promotions=Promotion.find_by_date(params[:date])
    elsif params.has_key?(:cuisine)
      @promotions=Promotion.find_by_cuisine(params[:cuisine])
    elsif params.has_key?(:theme)
      @promotions=Promotion.find_by_theme(params[:theme])
    end
  end

  # finds results based on text search
  def fuzzy
    # TODO  avoid sql injection
    @promotions=Promotion.find_promotion_text("%#{params[:keyword].downcase}%")

    render 'index'
  end
end
