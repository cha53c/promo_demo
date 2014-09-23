require 'spec_helper'
require 'rails_helper'

RSpec.describe PromotionsController do
  let(:client) {mock_model(Client)}

  describe 'GET new' do

    it "renders new" do
      get :new, :client_id => client.id
      expect(subject).to render_template('promotions/new')

    end
  end

describe 'POST create' do
  before {
    promotion = instance_double('Promotion')
    allow(Client).to receive(:find).and_return(client)
    allow(client).to receive(:promotions).and_return(promotion)
  }
  subject{post :create, :client_id => client.id}

  it 'finds the client'
  # do
  #   expect(Client).to receive(:find).once()
  #   # post :create, :client_id => client.id
  #   post :create, FactoryGirl.attributes_for(:user)
  # end
  it 'creates a new promotion for the client'
  it 'redirects to client show'

end

end