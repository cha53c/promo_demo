require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index, date: 'today'
      expect(response).to be_success
    end
  end

end
