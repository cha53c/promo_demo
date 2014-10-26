require 'spec_helper'
require 'rails_helper'

RSpec.describe ClientsController do
  let(:params) { {client: {name: "testclient", tel: "123", email: "me@home.com",
                           website: "www.bookme.com", photo: Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/images/test_image.jpg')}} }
  let(:user) { FactoryGirl.build_stubbed(:user) }

  before {
    allow(User).to receive(:find).and_return(user)
    session[:user_id] = user.id
  }

  describe "GET new", focus: true do
    subject(:get_new) { get :new }
    it "returns http success" do
      expect(get_new).to have_http_status(200)
    end

    it "renders new" do
      expect(get_new).to render_template('clients/new')
    end
  end

  describe "GET index" do
    subject(:get_index) { get :index }
    it "returns http success" do
      expect(get_index).to have_http_status(200)
    end

    it "renders index" do
      expect(get_index).to render_template("clients/index")
    end

    it "calls all on client" do
      # TODO example should check correct parameter is passed
      expect(Client).to receive(:all).once()
      get_index
    end
  end

  describe "GET show/:id" do
    let!(:client) { mock_model(Client) }
    subject(:get_show) { get :show, :id => client.id }

    before {
      allow(Client).to receive(:find).and_return(client)
    }
    it "calls find only once" do
      # TODO test correct parameters
      expect(Client).to receive(:find).once()
      get_show
    end
    it "returns http success" do
      expect(get_show).to have_http_status(200)
    end

    it "renders show" do
      expect(get_show).to render_template("clients/show")
    end
  end

  describe "GET edit/:id", focus: true do
    let!(:client) { mock_model(Client) }
    subject(:get_edit) { get :edit, :id => client.id }

    before {
      allow(Client).to receive(:find).and_return(client)
    }
    it "calls find on Client" do
      expect(Client).to receive(:find).once()
      get_edit
    end
    it "returns http success" do
      expect(get_edit).to have_http_status(200)
    end
    it "renders edit" do
      expect(get_edit).to render_template('clients/edit')
    end
  end

  describe "PATCH update" do
    let!(:client) { mock_model(Client) }
    subject(:patch_update) { patch :update, {id: client.id, client: params} }

    before {
      allow(Client).to receive(:find).and_return(client)
      allow(client).to receive(:update).with(any_args)
    }
    it "calls find on Client" do
      expect(Client).to receive(:find).once()
      patch_update
    end
    it "assigns @client" do
      patch_update
      assigns[:client].should eq(client)

    end
    it "calls save on client" do
      allow(patch_update).to receive(:save)
    end
    context "when client updates successfully" do
      before {
        allow(client).to receive(:update) { true }
      }
      it "sets a flash message" do
        patch_update
        expect(flash[:notice]).to eq("Successfully updated")
      end
      it "redirects to client index" do
        expect(patch_update).to redirect_to :action => :show,
                                            :id => assigns(:client).id
      end
    end
    context "when client fails to update" do
      before {
        allow(client).to receive(:update) { false }
      }
      it "sets a flash message" do
        patch_update
        expect(flash[:alert]).to eq("Failed to update")
      end
      it "redirects to edit" do
        expect(patch_update).to render_template('clients/edit')
      end
    end
  end

  describe "POST create" do
    let!(:client) { mock_model(Client, :save => nil) }
    subject(:post_create) { post :create, params }
    before {
      allow(Client).to receive(:new).and_return(client)
    }

    it "creates a new client" do
      expect(Client).to receive(:new).and_return(client)
      post_create
    end
    it "saves the client" do
      allow(client).to receive(:save) { true }
      expect(client).to receive(:save).with(no_args)
      post_create
    end

    context "when client saves successfully" do
      it "sets a flash message" do
        allow(client).to receive(:save) { true }
        post_create
        flash[:notice].should eq("Successfully added client")
      end
      it "redirects to clients/:id" do
        allow(client).to receive(:save) { true }
        expect(post_create).to redirect_to :action => :show,
                                           :id => assigns(:client).id
      end
      it "returns http success" do
        expect(post_create).to have_http_status(200)
      end
    end
    context "when the client fails to save" do
      it "sets a flash message" do
        post_create
        flash[:alert].should eq("Could not add new client")
      end
      it "renders new template" do
        expect(post_create).to render_template('clients/new')
      end
    end
  end

  describe "DELETE destroy" do
    let!(:client) { mock_model(Client) }
    subject(:delete_destroy) { delete :destroy, :id => client.id }

    before {
      allow(Client).to receive(:find).and_return(client)
    }

    it "calls find on Client" do
      # TODO check the correct id is passed
      expect(Client).to receive(:find).once()
      delete_destroy
    end
    it "calls destroy on client" do
      expect(client).to receive(:destroy).with(no_args)
      delete_destroy
    end
    it "returns http redirect" do
      expect(delete_destroy).to have_http_status(302)
    end

    it "redirects to clients index" do
      expect(delete_destroy).to redirect_to action: :index
    end
  end
end