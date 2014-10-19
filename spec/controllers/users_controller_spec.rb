require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) { mock_model(User) }

  let(:user) { FactoryGirl.build_stubbed(:user) }

  before {
    allow(User).to receive(:find).and_return(user)
    session[:user_id] = user.id
  }

  describe "GET new" do
    subject(:get_new) { get :new }
    it "renders new" do
      expect(get_new).to render_template('users/new')
    end
  end

  describe "POST create" do
    subject(:post_create) { post :create, user: attributes_for(:user) }
    it 'call save on user' do
      expect(User).to receive(:new).and_return(user)
      expect(user).to receive(:save)
      post_create
    end
    # context 'user save successfully'
  end

end
