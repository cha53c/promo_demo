require 'spec_helper'
require 'rails_helper'
require 'rack/test'


RSpec.describe ClientsController do
  let(:params) { {:client => {:name => "testclient", :tel => "123", :email => "me@home.com", :website => "www.bookme.com", :photo => Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg')}} }

  describe "GET new" do
    subject {get :new}
    it "returns http success" do
      expect(subject).to have_http_status(200)
    end

    it "renders new" do
      expect(subject).to render_template('clients/new')
    end
  end

  describe "GET index" do
    subject { get :index }
    it "returns http success" do
      expect(subject).to have_http_status(200)
    end

    it "renders index" do
      expect(subject).to render_template("clients/index")
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
    let!(:client) { mock_model(Client, :save => nil) }
    subject { post :create, params }


    it "creates a new client" do
      expect(Client).to receive(:new).and_return(client)
      post :create, params
    end
    it "saves the client", :saves => true do
      # TODO fails without the expect client, there must be a better way
      expect(Client).to receive(:new).and_return(client)
      client.stub(:save) { true }
      expect(client).to receive(:save).with(no_args)
      post :create, params
    end

    context "when client saves successfully" do
      it "sets a flash[:notice] message", :saves => true do
        # TODO fails without the expect client, there must be a better way
        expect(Client).to receive(:new).and_return(client)
        client.stub(:save) { true }
        post :create, params
        flash[:notice].should eq("successfully added client")
      end
      it "redirects to clients/:id", :saves => true do
        # TODO fails without the expect client, there must be a better way
        expect(Client).to receive(:new).and_return(client)
        client.stub(:save) { true }
        expect(subject).to redirect_to :action => :show,
                                       :id => assigns(:client).id
      end
      it "returns http success", :saves => true do
        expect(subject).to have_http_status(200)
      end
    end
    context "when the client fails to save", :saves => true do
      it "sets a flash[:notice] message" do
        post :create, params
        flash[:notice].should eq("could not add new client")
      end
      it "renders new template", :saves => true do
        expect(subject).to render_template('clients/new')
      end
    end
  end

  describe "DELETE destroy" do
    it "returns http success"
    it "redirects to clients index"
  end
end