require 'spec_helper'
require 'rails_helper'

RSpec.describe PromotionsController do
  let(:client) {mock_model(Client)}
  let(:promotion) {mock_model(Promotion)}
  let(:params) { {:promotion => {:promo_type => "promo1", :client_id => client.id}}}

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
  subject{post :create, :client_id => client, :promotion => {:promo_type => "promo1", :client_id => client.id}}


  it 'finds the client' do
    expect(Client).to receive(:find).once()
    post :create, :client_id => client, :promotion => {:promo_type => "promo1", :client_id => client.id}
  end
  it 'assigns a new promotion for the client' do
    post :create, :client_id => client, :promotion => {:promo_type => "promo1", :client_id => client.id}
    expect(assigns[:promotion]).to eq(promotion)
  end
  it 'redirects to client show' do
    expect(subject).to redirect_to("/clients/#{assigns(:client).id}")
  end


end

end