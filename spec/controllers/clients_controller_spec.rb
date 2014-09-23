require 'spec_helper'
require 'rails_helper'

RSpec.describe ClientsController do
  let(:params) { {:client => {:name => "testclient", :tel => "123", :email => "me@home.com", :website => "www.bookme.com", :photo => Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg')}} }

  describe "GET new" do
    subject { get :new }
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

    it "calls all on client" do
      # TODO check correct parameter is passed
      expect(Client).to receive(:all).once()
      get :index
    end
  end

  describe "GET show/:id" do
    let!(:client) { mock_model(Client) }
    subject { get :show, :id => client.id }
    before {
      allow(Client).to receive(:find).and_return(client)
    }
    it "calls find only once" do
      # TODO test correct parameters
      expect(Client).to receive(:find).once()
      get :show, :id => client.id
    end
    it "returns http success" do
      expect(subject).to have_http_status(200)
    end

    it "renders show" do
      expect(subject).to render_template("clients/show")
    end
  end

  describe "GET edit/:id" do
    let!(:client) { mock_model(Client) }
    subject {get :edit, :id => client.id}
    before {
      allow(Client).to receive(:find)
    }
    it "calls find on Client" do
      expect(Client).to receive(:find).once()
      get :edit, :id => client.id
    end
    it "returns http success" do
      expect(subject).to have_http_status(200)
    end
    it "renders edit" do
      expect(subject).to render_template('clients/edit')
    end
  end

  describe "PATCH update" do
    let!(:client) {mock_model(Client)}
    subject {patch :update, {id: client.id, client: params}}
    before {
      allow(Client).to receive(:find).and_return(client)
      allow(client).to receive(:update).with(any_args)
    }
    it "calls find on Client" do
      expect(Client).to receive(:find).once()
      patch :update, {id: client.id, client: params}
    end
    it "assigns @client" do
      patch :update, {id: client.id, client: params}
      assigns[:client].should eq(client)

    end
    it "calls save on client" do
      allow(subject).to receive(:save)
    end
    context "when client updates successfully" do
      before {
        allow(client).to receive(:update) {true}
      }
      it "sets a flash[:notice] message" do
        patch :update, {id: client.id, client: params}
        expect(flash[:notice]).to eq("update complete")
      end
      it "redirects to client index" do
        expect(subject).to redirect_to :action => :show,
                                       :id => assigns(:client).id
      end
    end
    context "when client fails to update" do
      before {
        allow(client).to receive(:update) {false}
      }
      it "sets a flash[:notice] message" do
        patch :update, {id: client.id, client: params}
        expect(flash[:notice]).to eq("update failed")
      end
      it "redirects to edit" do
        expect(subject).to render_template('clients/edit')
      end
    end
  end

  describe "POST create" do
    let!(:client) { mock_model(Client, :save => nil) }
    subject { post :create, params }
    before {
      allow(Client).to receive(:new).and_return(client)
    }

    it "creates a new client" do
      expect(Client).to receive(:new).and_return(client)
      post :create, params
    end
    it "saves the client" do
      allow(client).to receive(:save) {true}
      expect(client).to receive(:save).with(no_args)
      post :create, params
    end

    context "when client saves successfully" do
      it "sets a flash[:notice] message" do
        allow(client).to receive(:save) {true}
        post :create, params
        flash[:notice].should eq("successfully added client")
      end
      it "redirects to clients/:id" do
        allow(client).to receive(:save) {true}
        expect(subject).to redirect_to :action => :show,
                                       :id => assigns(:client).id
      end
      it "returns http success" do
        expect(subject).to have_http_status(200)
      end
    end
    context "when the client fails to save" do
      it "sets a flash[:notice] message" do
        post :create, params
        flash[:notice].should eq("could not add new client")
      end
      it "renders new template" do
        expect(subject).to render_template('clients/new')
      end
    end
  end

  describe "DELETE destroy" do
    let!(:client) { mock_model(Client) }
    subject{delete :destroy, :id => client.id}
    before {
      allow(Client).to receive(:find).and_return(client)
    }

    it "calls find on Client" do
      # TODO check the correct id is passed
      expect(Client).to receive(:find).once()
      delete :destroy, :id => client.id
    end
    it "calls destroy on client" do
      expect(client).to receive(:destroy).with(no_args)
      delete :destroy, :id => client.id
    end
    it "returns http redirect" do
      expect(subject).to have_http_status(302)
    end

    it "redirects to clients index" do
      expect(subject).to redirect_to :action => :index
    end
  end
end