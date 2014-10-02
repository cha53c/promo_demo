class SearchController < ApplicationController
  helper :clients

  # TODO factor details out of the controller
  # finds all the promotions for today
  def index
    today = Date.today
    wdays = ['sun','mon','tue','wed','thu','fri','sat']
    day = wdays[today.wday]
    query = "starts <= ? AND " + day + " = ?"
    @promotions=Promotion.where(query, today, true)
  end


  def fuzzy
    # TODO  avoid sql injection
    param_keyword = "%#{params[:keyword].downcase}%"
    # TODO does not seem to return an array
    @promotions=Promotion.where("lower(description) LIKE ? OR lower(promo_type) LIKE ?", param_keyword, param_keyword)
    render 'home/index'
  end
end
