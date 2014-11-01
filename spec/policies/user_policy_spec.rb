require 'rspec'
require 'spec_helper'
require 'rails_helper'

# TODO rewrite to avoid clash with the shoulda permit method

RSpec.describe UserPolicy do
  subject(:policy) { described_class }
  let(:user_class) { FactoryGirl.build_stubbed(:user) }
  # context 'for a visitor' do
  #   permissions :new? do
  #     let(:user_login) { nil }
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_login, user_class)
  #     end
  #   end
  # end
  # context 'for a logged in user' do
  #   permissions :new? do
  #     let(:user_loggin) { FactoryGirl.build_stubbed(:user) }
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_loggin, user_class)
  #     end
  #   end
  # end
end