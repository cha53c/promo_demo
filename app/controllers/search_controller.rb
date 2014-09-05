class SearchController < ApplicationController
  helper :clients

  def index
    today = Date.today
    # TODO factor details out of the controller
    wdays = ['sun','mon','tue','wed','thu','fri','sat']
    day = wdays[today.wday]
    query = "starts <= ? AND " + day + " = ?"
    @promotions=Promotion.where(query, today, true)

  end
end
