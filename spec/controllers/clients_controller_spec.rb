require 'spec_helper'
require 'rails_helper'
require 'rack/test'


RSpec.describe ClientsController do
  # let(:client) do
  #   mock_model Client, :all => client
  let(:params) {{:client => {:name => "testclient", :tel =>"123", :email => "me@home.com", :website => "www.bookme.com", :photo => Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg')}}}

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response.status).to eq(200)
    end

    it "renders new" do
      get :new
      expect(response).to render_template('clients/new')
    end
  end

  describe "GET index" do

    it "returns http success" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders index" do
      get :index
      expect(response).to render_template("clients/index")
    end

    it "calls all on client"


  end

  describe "GET show" do
    it "returns http success"
    it "renders show"
  end

  describe "GET edit" do
    it "returns http success"
    it "renders edit"
  end

  describe "PATCH update" do
    it "returns http success"
    context "when client updates successfully" do
      it "sets a flash[:notice] message"
      it "redirects to client index"
    end
    context "when client fails to update" do
      it "assigns @client"
      it "sets a flash[:notice] message"
      it "redirects to edit"
    end
  end

  describe "POST create" do

    # let (:client) { mock_model(Client).as_null_object }
    # before do
    #   client.stub(:new).and_return(client)
    # end

    it "creates a new client"
    # do
    #   client = mock_model(Client)
    #   # client.stub(:create).and_return(client)
    #   allow(client).to receive(:new).with(:params).and_return(client)
    #   # client.should_receive(:create).with(:tel => '12345')
    #   expect(client).to receive(:new).with(:params)
    #   post :create, :client => {:params => {}}
    #        # :photo => File.new(Rails.root + 'spec/fixtures/images/test_image.jpg')
    #
    # end
    it "saves the client"
    # do
    #   client = instance_double("Client")
    #   allow(client).to receive(:save).and_return(true)
    #   expect(client).to receive(:save)
    #   post :create, params
    # end

    context "when client saves successfully" do
      it "sets a flash[:notice] message"
      it "redirects to the client show page"
    end
    context "when the client fails to save" do
      it "sets a flash[:notice] message" do
        post :create, params
        flash[:notice].should eq("could not add new client")
      end
      it "redirects to new template" do
        post :create, params
        expect(response).to render_template('clients/new')
      end
    end

  end

  describe "DELETE destroy" do
    it "returns http success"
    it "redirects to clients index"
  end
end