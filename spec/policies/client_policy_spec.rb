require 'spec_helper'
require 'rails_helper'

# TODO rewrite to avoid clash with the shoulda permit method

RSpec.describe ClientPolicy do

  let(:user_not_logged_in) { nil }
  let(:user_logged_in) { FactoryGirl.build_stubbed(:user) }
  let(:client) { mock_model(Client) }

  subject(:policy) { described_class }

  # context 'for a visitor' do
  #   # permissions ".scope" do
  #   #   pending "add some examples to (or delete) #{__FILE__}"
  #   # end
  #   permissions :new? do
  #     it 'should not permit_it action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  #   permissions :create? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  #   permissions :show? do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #     # it 'should permit action' do
  #     #   expect(policy).to permit_it(user_not_logged_in, client)
  #     # end
  #   end
  #
  #   permissions :show? do
  #     pending "add some examples to (or delete) #{__FILE__}"
  #     # it 'should permit action' do
  #     #   expect(policy).to permit_it(user_not_logged_in, client)
  #     # end
  #   end
  #
  #   permissions :update? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  #   permissions :destroy? do
  #     it 'should not permit action' do
  #       expect(policy).not_to permit_it(user_not_logged_in, client)
  #     end
  #   end
  #
  # end
  #
  # context 'for a logged in user' do
  #   # permissions ".scope" do
  #   #   pending "add some examples to (or delete) #{__FILE__}"
  #   # end
  #
  #   permissions :index? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :new? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :create? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :show? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :update? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  #
  #   permissions :destroy? do
  #     it 'should permit action' do
  #       expect(policy).to permit_it(user_logged_in, client)
  #     end
  #   end
  # end
end
