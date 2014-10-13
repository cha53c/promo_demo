require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET logout" do
    it "returns http success" do
      get :logout
      expect(response).to be_success
    end
  end

end
