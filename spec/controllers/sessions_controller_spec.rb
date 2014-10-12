require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET login" do
    it "returns http success" do
      get :login
      expect(response).to be_success
    end
  end

  describe "GET logout" do
    it "returns http success" do
      get :logout
      expect(response).to be_success
    end
  end

end
