class SearchController < ApplicationController
  helper :clients

  def index
    today = Date.today
    # wdays = [mon,tue,wed,thu,fri,sat,sun]
    # day = wdays[today.wday]
    # query = "starts <= ? AND " + day + " = TRUE"
    @promotions=Promotion.where("starts <= ? AND mon = ?", today, true)

  end
end
