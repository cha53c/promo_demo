class HomeController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def find_client id
    @client = Client.find(id)
  end

  helper_method :find_client
end
