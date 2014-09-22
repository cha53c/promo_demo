require 'spec_helper'
require 'rails_helper'

RSpec.describe PromotionsController do


  describe 'GET new' do
    let!(:client) {mock_model(Client)}
    # subject {get :new, :client_id => client.id}
    it "renders new" do
      expect(subject).to render_template('promotions/new')
      get :new, :client_id => client.id
    end
  end


end