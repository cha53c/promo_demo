require 'rspec'
require 'spec_helper'
require 'rails_helper'

RSpec.describe UserPolicy do
  subject(:policy) { described_class }

  context 'for a visitor' do
    permissions :new? do
      let(:user_login) { nil }
      let(:user_class) { FactoryGirl.build_stubbed(:user) }
      it 'should not permit action' do
        expect(policy).not_to permit(user_login, user_class)
      end
    end
  end
  context 'for a logged in user' do
    permissions :new? do
      let(:user_loggin) { FactoryGirl.build_stubbed(:user) }
      let(:user_class) { FactoryGirl.build_stubbed(:user) }
      it 'should permit action' do
        expect(policy).to permit(user_loggin, user_class)
      end
    end
  end
end