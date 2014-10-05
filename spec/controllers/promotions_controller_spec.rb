require 'spec_helper'
require 'rails_helper'

RSpec.describe PromotionsController do
  let(:client) { mock_model(Client) }
  let(:promotion) { mock_model(Promotion) }
  let(:params) { {client_id: client, id: promotion.id,
                  promotion: {promotion: {promo_type: "promo1"}}} }

  before {
    allow(Client).to receive(:find).and_return(client)
    allow(client).to receive(:promotions).and_return(promotion)
    allow(promotion).to receive(:create).and_return(promotion)
    allow(promotion).to receive(:find).and_return(promotion)
    allow(Promotion).to receive(:find)
  }

  describe 'GET new' do
    subject(:get_new) { get :new, :client_id => client.id }
    it "renders new" do
      expect(get_new).to render_template('promotions/new')
    end
  end

  describe 'POST create' do
    subject(:post_create) { post :create, params }

    it 'finds the client' do
      expect(Client).to receive(:find).once()
      post_create
    end
    it 'assigns a new promotion for the client' do
      post_create
      expect(assigns[:promotion]).to eq(promotion)
    end
    it 'redirects to client show' do
      expect(post_create).to redirect_to("/clients/#{assigns(:client).id}")
    end
  end

  describe 'PATCH update' do
    before {
      expect(Promotion).to receive(:find).and_return(promotion)
      expect(Client).to receive(:find).and_return(client)
    }
    subject(:patch_update) { patch :update, params }
    it 'calls update on the promotion' do
      expect(promotion).to receive(:update)
      patch_update
    end
    context 'when promotion updates successfully' do
      it 'sets flash notice' do
        expect(promotion).to receive(:update).and_return(true)
        patch_update
        expect(flash[:notice]).to eq("Successfully updated promotion")
      end
      it 'renders edit' do
        expect(promotion).to receive(:update).and_return(true)
        expect(patch_update).to render_template("edit")
      end
    end

    context 'when promotion update fails' do
      it 'sets flash notice' do
        expect(promotion).to receive(:update).and_return(false)
        patch_update
        expect(flash[:notice]).to eq("promotion update failed")
      end
      it 'renders promotions edit' do
        expect(promotion).to receive(:update).and_return(false)
        expect(patch_update).to render_template('edit')
      end
    end
  end

  describe "GET destroy" do

    subject(:delete_destroy) { delete :destroy, params }
    it 'destroys the promotion' do
      expect(promotion).to receive(:destroy)
      delete_destroy
    end
    it 'redirects to the clients page' do
      expect(delete_destroy).to redirect_to("/clients/#{assigns(:client).id}")
    end
  end

  describe "GET edit" do
    subject(:get_edit) { get :edit, params }
    it "finds promotion" do
      expect(Promotion).to receive(:find).and_return(promotion)
      get_edit
    end
    it "finds client" do
      expect(Client).to receive(:find).and_return(client)
      get_edit
    end
  end
end