require 'spec_helper'
require 'rails_helper'

RSpec.describe PromotionsController do
  let(:client) { mock_model(Client) }
  let(:promotion) { mock_model(Promotion) }
  let(:params) { {:promotion => {:promo_type => "promo1", :client_id => client.id}} }

  describe 'GET new' do

    it "renders new" do
      get :new, :client_id => client.id
      expect(subject).to render_template('promotions/new')
    end
  end

  describe 'POST create' do
    before {
      allow(Client).to receive(:find).and_return(client)
      allow(client).to receive(:promotions).and_return(promotion)
      allow(promotion).to receive(:create).and_return(promotion)
    }
    subject(:post_create) { post :create, :client_id => client, :promotion => {:promo_type => "promo1", :client_id => client.id} }


    it 'finds the client' do
      expect(Client).to receive(:find).once()
      post :create, :client_id => client, :promotion => {:promo_type => "promo1", :client_id => client.id}
    end
    it 'assigns a new promotion for the client' do
      post :create, :client_id => client, :promotion => {:promo_type => "promo1", :client_id => client.id}
      expect(assigns[:promotion]).to eq(promotion)
    end
    it 'redirects to client show' do
      expect(post_create).to redirect_to("/clients/#{assigns(:client).id}")
    end

  end

  describe 'PATCH update' do
    before {
      allow(Client).to receive(:find).and_return(client)
      allow(client).to receive(:promotions).and_return(promotion)
      allow(promotion).to receive(:create).and_return(promotion)
      expect(Promotion).to receive(:find).and_return(promotion)
      expect(Client).to receive(:find).and_return(client)
    }
    subject(:patch_update) { patch :update, client_id: client, id: promotion.id, promotion: params }
    # it 'finds the promotion'
    # it 'finds the client'
    it 'calls update on the promotion'
    context 'when promotion updates successfully' do
      it 'renders clients show', :patch => true do
        expect(promotion).to receive(:update).and_return(true)
        expect(patch_update).to render_template("clients/show")
      end
    end

    context 'when promotion update fails', :patch => true do
      it 'sets flash[:notice] message' do
        expect(promotion).to receive(:update)
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
    it 'finds the promotion'
    it 'destroys the promotion'
    it 'redirects to the clients page'
  end

end