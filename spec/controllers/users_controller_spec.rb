require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) { mock_model(User) }

  let(:user) { FactoryGirl.build_stubbed(:user) }

  before {
    allow(User).to receive(:find).and_return(user)
    session[:user_id] = user.id
  }

end
