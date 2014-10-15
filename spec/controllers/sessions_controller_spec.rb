require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    let(:get_new) {get :new}
    it 'renders new' do
      expect(get_new).to render_template('sessions/new')
    end
  end

end
