class HomeController < ApplicationController
  def index
    # TODO this should probably call the index action on promotions
    @promotions = Promotion.all
  end

  def find_client id
    @client = Client.find(id)
  end

  helper_method :find_client
end
